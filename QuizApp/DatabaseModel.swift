//
//  DatabaseModel.swift
//  QuizApp
//
//  Created by Nitish Dash on 25/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import Foundation
import RealmSwift



//Dirty solution! BE SURE TO IMPLEMENT LIST OF OBJECTS OF QUESTIONS IN NEXT UPDATION

class DatabaseModel: Object{
    
    dynamic var title = ""
    dynamic var category = ""
    dynamic var id = 0
    dynamic var q1 = ""
    dynamic var a1q1 = ""
    dynamic var a2q1 = ""
    dynamic var a3q1 = ""
    dynamic var a4q1 = ""
    dynamic var q1a = 0
    dynamic var q2 = ""
    dynamic var a1q2 = ""
    dynamic var a2q2 = ""
    dynamic var a3q2 = ""
    dynamic var a4q2 = ""
    dynamic var q2a = 0
    dynamic var q3 = ""
    dynamic var a1q3 = ""
    dynamic var a2q3 = ""
    dynamic var a3q3 = ""
    dynamic var a4q3 = ""
    dynamic var q3a = 0
    dynamic var q4 = ""
    dynamic var a1q4 = ""
    dynamic var a2q4 = ""
    dynamic var a3q4 = ""
    dynamic var a4q4 = ""
    dynamic var q4a = 0
    dynamic var q5 = ""
    dynamic var a1q5 = ""
    dynamic var a2q5 = ""
    dynamic var a3q5 = ""
    dynamic var a4q5 = ""
    dynamic var q5a = 0
    

override static func primaryKey() -> String? {
    return "id"
}

    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(DatabaseModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }

}
