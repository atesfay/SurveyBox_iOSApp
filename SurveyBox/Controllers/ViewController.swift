//
//  ViewController.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/24/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLinearGradient(gradientView: backgroundView, firstColor: #colorLiteral(red: 0, green: 0.6901960784, blue: 1, alpha: 1), secondColor: #colorLiteral(red: 0.1568627451, green: 0.1254901961, blue: 0.4705882353, alpha: 1), radius: 0)
    }


}

