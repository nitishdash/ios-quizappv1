//
//  CreateQuiz2.swift
//  QuizApp
//
//  Created by Nitish Dash on 25/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class CreateQuizFinal: UIViewController {
    
    @IBOutlet weak var questionTF: UITextField!
    
    @IBOutlet weak var option1TF: UITextField!
    
    @IBOutlet weak var option2TF: UITextField!
    
    @IBOutlet weak var option3TF: UITextField!
    
    @IBOutlet weak var option4TF: UITextField!
    
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
    
    @IBOutlet weak var blueTickImage: UIImageView!
    
    @IBOutlet weak var questionCounter: UILabel!
    
    @IBOutlet weak var save: UIButton!
    
    var titleText = String()
    var categoryText = String()
    var counter = 0
    var counter2 = 0
    var correctOption = "1"
    var data = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    
    func saveQuestion(){
        
        let quiz1 = DatabaseModel()
        quiz1.title = data.title
        quiz1.category = data.category
        quiz1.q1 = data.q1
        quiz1.a1q1 = data.a1q1
        quiz1.a2q1 = data.a2q1
        quiz1.a3q1 = data.a3q1
        quiz1.a4q1 = data.a4q1
        quiz1.q1a  = data.q1a
        quiz1.q2 = data.q1
        quiz1.a1q2 = data.a1q2
        quiz1.a2q2 = data.a2q2
        quiz1.a3q2 = data.a3q2
        quiz1.a4q2 = data.a4q2
        quiz1.q2a  = data.q2a
        quiz1.q3 = data.q3
        quiz1.a1q3 = data.a1q3
        quiz1.a2q3 = data.a2q3
        quiz1.a3q3 = data.a3q3
        quiz1.a4q3 = data.a4q3
        quiz1.q3a  = data.q3a
        quiz1.q4 = data.q4
        quiz1.a1q4 = data.a1q4
        quiz1.a2q4 = data.a2q4
        quiz1.a3q4 = data.a3q4
        quiz1.a4q4 = data.a4q4
        quiz1.q4a  = data.q4a
        quiz1.q5 = data.q5
        quiz1.a1q5 = data.a1q5
        quiz1.a2q5 = data.a2q5
        quiz1.a3q5 = data.a3q5
        quiz1.a4q5 = data.a4q5
        quiz1.q5a  = data.q5a
        
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(quiz1)
            print("Added quiz!")
            
        }
        
    
    }
    
    func clearFields(){
        questionTF.text = ""
        option1TF.text = ""
        option2TF.text = ""
        option3TF.text = ""
        option4TF.text = ""
        segmentedCtrl.selectedSegmentIndex = 0
    }
    
    @IBAction func addButton(_ sender: Any) {
        //saveQuestion()
       
        
        if(counter2 == 0){
            //data.title = self.titleText
            //data.category = self.categoryText
            data.q1 = questionTF.text!
            data.a1q1 = option1TF.text!
            data.a2q1 = option2TF.text!
            data.a3q1 = option3TF.text!
            data.a4q1 = option4TF.text!
            data.q1a = segmentedCtrl.selectedSegmentIndex
            clearFields()
            questionCounter.text = "1"
        }
        
        else if(counter2 == 1){
            data.q2 = questionTF.text!
            data.a1q2 = option1TF.text!
            data.a2q2 = option2TF.text!
            data.a3q2 = option3TF.text!
            data.a4q2 = option4TF.text!
            data.q2a = segmentedCtrl.selectedSegmentIndex
            clearFields()
            questionCounter.text = "2"
        }

        else if(counter2 == 2){
            data.q3 = questionTF.text!
            data.a1q3 = option1TF.text!
            data.a2q3 = option2TF.text!
            data.a3q3 = option3TF.text!
            data.a4q3 = option4TF.text!
            data.q3a = segmentedCtrl.selectedSegmentIndex
            clearFields()
            questionCounter.text = "3"
        }
        else if(counter2 == 3){
            data.q4 = questionTF.text!
            data.a1q4 = option1TF.text!
            data.a2q4 = option2TF.text!
            data.a3q4 = option3TF.text!
            data.a4q4 = option4TF.text!
            data.q4a = segmentedCtrl.selectedSegmentIndex
            clearFields()
            questionCounter.text = "4"
        }
        else if(counter2 == 4){
            data.q5 = questionTF.text!
            data.a1q5 = option1TF.text!
            data.a2q5 = option2TF.text!
            data.a3q5 = option3TF.text!
            data.a4q5 = option4TF.text!
            data.q5a = segmentedCtrl.selectedSegmentIndex
            clearFields()
            questionCounter.text = "5"
            blueTickImage.isHidden = false
            save.isEnabled = true
        }
        else{
            //reset counter to 0
            //check if the save button was pressed or not
            
            
            
        }
        
         counter2 += 1
        
    }
    
    
    
    @IBAction func segmentedCtrlAction(_ sender: Any) {
        
        switch segmentedCtrl.selectedSegmentIndex {
            
        case 0:
            self.correctOption = "1"
            break
            
        case 1:
            self.correctOption = "2"
            break
            
        case 2:
            self.correctOption = "3"
            break
            
        case 3:
            self.correctOption = "4"
            break
            
        default:
            break
        }
        
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        saveQuestion()
        
    }
    
}
