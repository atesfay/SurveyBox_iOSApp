//
//  CreateSurveyViewController.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/26/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class CreateSurveyViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var option1TextField: UITextField!
    @IBOutlet weak var option2TextField: UITextField!
    @IBOutlet weak var option3TextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var questionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLinearGradient(gradientView: self.view, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: 0)
        createLinearGradient(gradientView: self.createButton, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: self.createButton.frame.height / 2)
        
        option1TextField.createPadding()
        option1TextField.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        
        option2TextField.createPadding()
        option2TextField.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        
        option3TextField.createPadding()
        option3TextField.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
    }
    
    override func viewDidLayoutSubviews() {
        mainView.createSpecificRoundCorner(corners: [.topLeft, .topRight], radius: 10)
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        
        Firestore.firestore().collection("users").document(Auth.auth().currentUser?.uid ?? "").getDocument { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }

            if let data = snapshot!.data() {
                let user = User(dictionary: data)
                
                let data: [String: Any] = [
                    "firstname": user.firstname,
                    "lastname": user.lastname,
                    "percentage": [0, 0, 0],
                    "question": self.questionTextView.text ?? "",
                    "answers": [self.option1TextField.text, self.option2TextField.text, self.option3TextField.text]
                ]
                
                Firestore.firestore().collection("surveys").addDocument(data: data) { (error) in
                    if let error = error {
                        print(error)
                        return
                    } else {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
