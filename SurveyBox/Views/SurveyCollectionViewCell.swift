//
//  SurveyCollectionViewCell.swift
//  SurveyBox
//
//  Created by Abraham Tesfay on 11/26/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import UIKit

class SurveyCollectionViewCell: UICollectionViewCell {
    
    //IBOutlets
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        
        self.cardView.createRoundCorner(cornerRadius: 15)
        firstChoiceButton.createBorder(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), radius: 5, width: 1)
        secondChoiceButton.createBorder(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), radius: 5, width: 1)
        thirdChoiceButton.createBorder(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), radius: 5, width: 1)
        viewButton.createRoundCorner(cornerRadius: self.viewButton.frame.height / 2)
    }
    
    func setupView(surveys: [Survey], index: Int) {
        questionLabel.text = surveys[index].question
        firstChoiceButton.setTitle(surveys[index].answers[0] as? String, for: .normal)
        secondChoiceButton.setTitle(surveys[index].answers[1] as? String, for: .normal)
        thirdChoiceButton.setTitle(surveys[index].answers[2] as? String, for: .normal)
        usernameLabel.text = "by \(surveys[index].firstname) \(surveys[index].lastname)"
    }
    
}
