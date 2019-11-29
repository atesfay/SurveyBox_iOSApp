//
//  SignupViewController.swift
//  SurveyBox
//
//  Created by Tesfay Abrahamon 11/24/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignupViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var createAccountView: UIView!
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var firstNameSelectedView: UIView!
    @IBOutlet weak var lastNameSelectedView: UIView!
    @IBOutlet weak var passwordSelectedView: UIView!
    @IBOutlet weak var confirmPasswordSelectedView: UIView!
    @IBOutlet weak var emailSelectedView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    //text fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLayoutSubviews() {
        firstNameSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
        lastNameSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
        passwordSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
        confirmPasswordSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
        emailSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLinearGradient(gradientView: self.view, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: 0)
        createAccountView.createRoundCorner(cornerRadius: 10)
        
        createLinearGradient(gradientView: self.createAccountButton, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: self.createAccountButton.frame.height / 2)
        
        firstNameView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        lastNameView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        passwordView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        confirmPasswordView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        emailView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
    }
    
    //after create a new user, users document will add a new document
    fileprivate func saveInfoToFirestore() {
        let uid = Auth.auth().currentUser?.uid ?? ""
        let docData: [String: Any] = [
            "firstName": firstNameTextField.text ?? "",
            "lastName": lastNameTextField.text ?? ""
        ]
        
        Firestore.firestore().collection("users").document(uid).setData(docData) { (error) in
            if let error = error {
                print("Fail to add to the database ", error)
                return
            }
            //show to welcome view controller
            let welcomeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
            self.navigationController?.pushViewController(welcomeVC, animated: true)
        }
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        startSpinnerAnimation(view: self.view)
               //if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (result, error) in
            if let error = error {
                print(error)
                showAlert(viewController: self, title: "Signup error", message: error.localizedDescription)
                spinner.removeFromSuperview()
                return
           }
           
            spinner.removeFromSuperview()
            self.saveInfoToFirestore()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
