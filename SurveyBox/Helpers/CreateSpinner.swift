//
//  CreateSpinner.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/25/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit

let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    spinner.createRoundCorner(cornerRadius: 10)
    spinner.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.hidesWhenStopped = true
    return spinner
}()

func startSpinnerAnimation(view: UIView) {
    view.addSubview(spinner)
    spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    spinner.startAnimating()
}
