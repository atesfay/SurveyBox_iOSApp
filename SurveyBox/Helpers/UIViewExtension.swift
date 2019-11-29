//
//  UIViewExtension.swift
//  SurveyBox
//
//  Created by Tesfay Abraham on 11/24/19.
//  Copyright © 2019 AbrahamTesfay. All rights reserved.
//

import UIKit

extension UIView {
    func createRoundCorner(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func createBorder(color: UIColor, radius: CGFloat, width: Int) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1
        self.createRoundCorner(cornerRadius: radius)
    }
    
    func createSpecificRoundCorner(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UITextField {
    func createPadding() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

//create gradient
var gradientLayer: CAGradientLayer!

func createLinearGradient(gradientView: UIView, firstColor: UIColor, secondColor: UIColor, radius: CGFloat) {
    gradientLayer = CAGradientLayer()
    gradientLayer.frame = gradientView.bounds
    gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradientView.createRoundCorner(cornerRadius: radius)
    gradientView.clipsToBounds = true
    gradientView.layer.insertSublayer(gradientLayer, at: 0)
}

