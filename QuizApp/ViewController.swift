//
//  ViewController.swift
//  QuizApp
//
//  Created by Nitish Dash on 24/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var correctLabel: UILabel!
    
    var correctAnswer = 0
    var lastRndNum = 0
    
    var quizId = 0
    var count = 1
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //randomQuestionDatabase()
        
        correctLabel.isHidden = true
        nextButton.isHidden = true
        
        quizId += 1
        
        print(quizId)
        
        directQuestion()
       
        Button1.backgroundColor=UIColor.darkGray
        Button2.backgroundColor=UIColor.darkGray
        Button3.backgroundColor=UIColor.darkGray
        Button4.backgroundColor=UIColor.darkGray
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    @IBAction func Button1Action(_ sender: Any) {
        
        Button1.isEnabled = false
        Button2.isEnabled = false
        Button3.isEnabled = false
        Button4.isEnabled = false

        
        if(correctAnswer==0){
            
            score += 20
            
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.green
            correctLabel.text = "CORRECT!"
            
            NSLog("You are correct!")
            Button1.backgroundColor=UIColor.green
        }
        else{
            //directQuestion()
            
            
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.red
            correctLabel.text = "WRONG!"
            NSLog("You are wrong!")
            
            Button1.backgroundColor=UIColor.red
            
        }
        
    }
    
    @IBAction func Button2Actions(_ sender: Any) {
        
        
        Button1.isEnabled = false
        Button2.isEnabled = false
        Button3.isEnabled = false
        Button4.isEnabled = false
    
        
        if(correctAnswer==1){
            
            score += 20
            
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.green
            correctLabel.text = "CORRECT!"
            
            Button2.backgroundColor=UIColor.green

            
        }
        else{
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.red
            correctLabel.text = "WRONG!"
            NSLog("You are wrong!")
            Button2.backgroundColor=UIColor.red
            
        }
    }
    @IBAction func Button3Actions(_ sender: Any) {
        
        Button1.isEnabled = false
        Button2.isEnabled = false
        Button3.isEnabled = false
        Button4.isEnabled = false
        
        if(correctAnswer==2){
            
            score += 20
            
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.green
            correctLabel.text = "CORRECT!"
            Button3.backgroundColor=UIColor.green
        
        }
        else{
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.red
            correctLabel.text = "WRONG!"
            NSLog("You are wrong!")
            Button3.backgroundColor=UIColor.red

        }
        
    }

    @IBAction func Btn4Action(_ sender: Any) {
        
        Button1.isEnabled = false
        Button2.isEnabled = false
        Button3.isEnabled = false
        Button4.isEnabled = false
        
        if(correctAnswer==3){
            score += 20
            
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.green
            correctLabel.text = "CORRECT!"
            Button4.backgroundColor=UIColor.green

    }
        else{
            nextButton.isHidden = false
            correctLabel.isHidden = false
            correctLabel.textColor = UIColor.red
            correctLabel.text = "WRONG!"
            NSLog("You are wrong!")
            Button4.backgroundColor=UIColor.red
        }
    }
    @IBAction func NextQuestion(_ sender: Any) {
        
        Button1.isEnabled = true
        Button2.isEnabled = true
        Button3.isEnabled = true
        Button4.isEnabled = true
        
        Button1.backgroundColor=UIColor.darkGray
        Button2.backgroundColor=UIColor.darkGray
        Button3.backgroundColor=UIColor.darkGray
        Button4.backgroundColor=UIColor.darkGray
        
        directQuestion()
        
        
    }
    
    func randomQuestionDatabase(){
        
        var rndNum = arc4random() % 5
        
        rndNum+=1
        
        let realm = try! Realm()
        
        let allData = realm.objects(DatabaseModel)
        
        var filtered = allData.filter("id = \(quizId)")
        
        QuestionLabel.text = filtered[0].q1
        Button1.setTitle(filtered[0].a1q1, for: UIControlState.normal)
        Button2.setTitle(filtered[0].a2q1, for: UIControlState.normal)
        Button3.setTitle(allData[0].a3q1, for: UIControlState.normal)
        Button4.setTitle(allData[0].a4q1, for: UIControlState.normal)
        
        
//        for quiz in allData{
//
//        }
        
        //lastRndNum = Int(rndNum)
        
    }
    
    
    func directQuestion(){
        
        nextButton.isHidden = true
        correctLabel.isHidden = true
        
        let realm = try! Realm()
        
        let allData = realm.objects(DatabaseModel)
        
        var filtered = allData.filter("id = \(quizId)")
        
        
        if (count == 6) {
            //count = 1
            performSegue(withIdentifier: "scoreSegue", sender: Any?.self)
        }
        
        switch (count){
            
        case 1:
            
            QuestionLabel.text = filtered[0].q1
            Button1.setTitle(filtered[0].a1q1, for: UIControlState.normal)
            Button2.setTitle(filtered[0].a2q1, for: UIControlState.normal)
            Button3.setTitle(filtered[0].a3q1, for: UIControlState.normal)
            Button4.setTitle(filtered[0].a4q1, for: UIControlState.normal)
            correctAnswer = filtered[0].q1a
            
            break
            
        case 2:
            
            QuestionLabel.text = filtered[0].q2
            Button1.setTitle(filtered[0].a1q2, for: UIControlState.normal)
            Button2.setTitle(filtered[0].a2q2, for: UIControlState.normal)
            Button3.setTitle(filtered[0].a3q2, for: UIControlState.normal)
            Button4.setTitle(filtered[0].a4q2, for: UIControlState.normal)
            correctAnswer = filtered[0].q2a
            
            break

        case 3:
            
            QuestionLabel.text = filtered[0].q3
            Button1.setTitle(filtered[0].a1q3, for: UIControlState.normal)
            Button2.setTitle(filtered[0].a2q3, for: UIControlState.normal)
            Button3.setTitle(filtered[0].a3q3, for: UIControlState.normal)
            Button4.setTitle(filtered[0].a4q3, for: UIControlState.normal)
            correctAnswer = filtered[0].q3a
            
            break

        case 4:
            
            QuestionLabel.text = filtered[0].q4
            Button1.setTitle(filtered[0].a1q4, for: UIControlState.normal)
            Button2.setTitle(filtered[0].a2q4, for: UIControlState.normal)
            Button3.setTitle(filtered[0].a3q4, for: UIControlState.normal)
            Button4.setTitle(filtered[0].a4q4, for: UIControlState.normal)
            correctAnswer = filtered[0].q4a
            
            break

        case 5:
            
            QuestionLabel.text = filtered[0].q5
            Button1.setTitle(filtered[0].a1q5, for: UIControlState.normal)
            Button2.setTitle(filtered[0].a2q5, for: UIControlState.normal)
            Button3.setTitle(filtered[0].a3q5, for: UIControlState.normal)
            Button4.setTitle(filtered[0].a4q5, for: UIControlState.normal)
            correctAnswer = filtered[0].q5a
            
            break

            
            
        default:
            break
            
        }
        
        
        count += 1
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destVC : ScoreVC = segue.destination as! ScoreVC
        
        destVC.score = score
        
    }
}



