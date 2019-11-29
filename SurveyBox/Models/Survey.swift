//
//  Survey.swift
//  SurveyBox
//
//  Created by Abraham Tesfay on 11/26/19.
//  Copyright © 2019 abrahamtesfay. All rights reserved.
//

import Foundation

struct Survey {
    //let uid: String
    let question: String
    let answers: [Any]
    let firstname: String
    let lastname: String
    var percentage: [Any]
    let documentID: String?
    
    init(dictionary: [String: Any], documentID: String) {
        //self.uid = dictionary["uid"] as! String
        self.documentID = documentID
        self.question = dictionary["question"] as! String
        self.answers = dictionary["answers"] as! [Any]
        self.firstname = dictionary["firstname"] as! String
        self.lastname = dictionary["lastname"] as! String
        self.percentage = dictionary["percentage"] as! [Any]
    }

}

struct User {
    let firstname: String
    let lastname: String
    
    init(dictionary: [String: Any]) {
        self.firstname = dictionary["firstName"] as! String
        self.lastname = dictionary["lastName"] as! String
    }
}
