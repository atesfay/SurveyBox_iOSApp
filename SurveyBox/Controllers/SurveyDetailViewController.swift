//
//  SurveyDetailViewController.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/27/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SurveyDetailViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var voteButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var optionButtons: [UIButton]!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    //Variable
    var survey: Survey?
    var answer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = survey?.question
        firstOptionButton.setTitle(survey?.answers[0] as? String, for: .normal)
        secondOptionButton.setTitle(survey?.answers[1] as? String, for: .normal)
        thirdOptionButton.setTitle(survey?.answers[2] as? String, for: .normal)
        usernameLabel.text = "by \(survey?.firstname ?? "") \(survey?.lastname ?? "")"

        createLinearGradient(gradientView: self.view, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: 0)
        
        firstOptionButton.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        
        secondOptionButton.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        
        thirdOptionButton.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        
        createLinearGradient(gradientView: self.voteButton, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: self.voteButton.frame.height / 2)
    }
    
    override func viewDidLayoutSubviews() {
        self.mainView.createSpecificRoundCorner(corners: [.topLeft, .topRight], radius: 15)
    }
    
    func buttonSelection(sender: UIButton) {
        optionButtons.forEach { (button) in
            if button == sender {
                button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            } else {
                button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBAction func firstOptionButtonPressed(_ sender: UIButton) {
        buttonSelection(sender: sender)
        answer = 1
    }
    
    @IBAction func secondOptionButtonPressed(_ sender: UIButton) {
        buttonSelection(sender: sender)
        answer = 2
    }
    
    @IBAction func thirdOptionButtonPressed(_ sender: UIButton) {
        buttonSelection(sender: sender)
        answer = 3
    }
    
    func updateAnswer(answer: Int, updatedSurvey: Survey) -> [String: Any] {
        
        if let first = updatedSurvey.percentage[0] as? Int, let second = updatedSurvey.percentage[1] as? Int, let third = updatedSurvey.percentage[2] as? Int {
            switch answer {
                case 1:
                    return ["percentage": [first + 1, second, third]]
                case 2:
                    return ["percentage": [first, second + 1, third]]
                default:
                    return ["percentage": [first, second, third + 1]]
            }
        }
        
        return [:]
    }
    
    @IBAction func voteButtonPressed(_ sender: UIButton) {
        if answer != 0 {
            sender.setTitle("Thanks for the response!", for: .normal)
            sender.isEnabled = false
            
            optionButtons.forEach { (button) in
                button.isEnabled = false
            }
            
            Firestore.firestore().collection("surveys").document(survey?.documentID ?? "").getDocument { (snapshot, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = snapshot!.data() {
                    let updatedSurvey = Survey(dictionary: data, documentID: self.survey?.documentID ?? "")
                    Firestore.firestore().collection("surveys").document(updatedSurvey.documentID ?? "").updateData(
                        self.updateAnswer(answer: self.answer, updatedSurvey: updatedSurvey)
                        ) { (error) in
                        if let error = error {
                            print(error)
                            return
                        }
                    }
                               
                    self.stackView.isHidden = false
                    self.firstLabel.text = "\(updatedSurvey.percentage[0] as! Int) people choose \(updatedSurvey.answers[0])."
                    self.secondLabel.text = "\(updatedSurvey.percentage[1] as! Int) people choose \(updatedSurvey.answers[1])."
                    self.thirdLabel.text = "\(updatedSurvey.percentage[2] as! Int) people choose \(updatedSurvey.answers[2])."
                }
            }
            
           
//                .whereField("question", isEqualTo: survey?.question ?? "").getDocuments { (snapshots, error) in
//                if let error = error {
//                    print(error)
//                    return
//                }
//
//                for document in snapshots!.documents {
//                    let data = document.data()
//                    print(data)
//                }
            //}
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
