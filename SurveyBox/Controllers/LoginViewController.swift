//
//  LoginViewController.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/24/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailSelectedView: UIView!
    @IBOutlet weak var passwordSelectedView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLayoutSubviews() {
        emailSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
        passwordSelectedView.createSpecificRoundCorner(corners: [.topLeft, .bottomLeft], radius: 5)
        createLinearGradient(gradientView: self.view, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        loginView.createRoundCorner(cornerRadius: 10)
        
        createLinearGradient(gradientView: self.loginButton, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: self.loginButton.frame.height / 2)
        
        emailView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
        passwordView.createBorder(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), radius: 5, width: 1)
    }
    
    fileprivate func loginUser() {
        startSpinnerAnimation(view: self.view)
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error)
                    showAlert(viewController: self, title: "Login error", message: error.localizedDescription)
                    spinner.removeFromSuperview()
                    return
                }
                
                //show to welcome view controller
                spinner.removeFromSuperview()
                let welcomeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
                self.navigationController?.pushViewController(welcomeVC, animated: true)
                
                print("Success")
            }
                
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        loginUser()
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        let signupVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupVC") as! SignupViewController
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
}
