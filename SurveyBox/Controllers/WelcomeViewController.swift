//
//  WelcomeViewController.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/25/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit
import FirebaseFirestore

class WelcomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //IBOutlets
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variables
    var surveys = [Survey]()
    
    func getSurveys() {
        Firestore.firestore().collection("surveys").getDocuments { (snapshots, error) in
            if let error = error {
                print(error)
                return
            }
            
            for document in snapshots!.documents {
                let data = document.data()
                let survey = Survey(dictionary: data, documentID: document.documentID)
                self.surveys.append(survey)
            }
            
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSurveys()
        
        createButton.createRoundCorner(cornerRadius: self.createButton.frame.height / 2)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        createLinearGradient(gradientView: self.view, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return surveys.count
    }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SurveyCell", for: indexPath) as! SurveyCollectionViewCell
        cell.setupView(surveys: surveys, index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 335, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as! SurveyDetailViewController
        
        detailVC.survey = surveys[indexPath.item]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        let createSurveyVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreateSurveyVC") as! CreateSurveyViewController
        self.navigationController?.pushViewController(createSurveyVC, animated: true)
    }
}
