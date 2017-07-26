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
    
    var correctAnswer = 0
    var lastRndNum = 0
    
    var quizId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        randomQuestionDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func RandomQuestions(){
        
        var rndNum = arc4random() % 4
        rndNum+=1
        
        switch(rndNum){
            
        case 1:
            QuestionLabel.text = "What is the capital of India?"
            Button1.setTitle("Delhi", for: UIControlState.normal)
            Button2.setTitle("Kolkata", for: UIControlState.normal)
            Button3.setTitle("Balasore", for: UIControlState.normal)
            Button4.setTitle("Bhubaneswar", for: UIControlState.normal)
//            correctAnswer = "1"
            break
            
        case 2:
            QuestionLabel.text = "What is the capital of India?"
            Button1.setTitle("Delhi", for: UIControlState.normal)
            Button2.setTitle("Kolkata", for: UIControlState.normal)
            Button3.setTitle("Balasore", for: UIControlState.normal)
            Button4.setTitle("Bhubaneswar", for: UIControlState.normal)
//            correctAnswer = "3"
            break
            
        case 3:
            QuestionLabel.text = "What is the capital of India?"
            Button1.setTitle("Delhi", for: UIControlState.normal)
            Button2.setTitle("Kolkata", for: UIControlState.normal)
            Button3.setTitle("Balasore", for: UIControlState.normal)
            Button4.setTitle("Bhubaneswar", for: UIControlState.normal)
//            correctAnswer = "4"
            break
            
        case 4:
            QuestionLabel.text = "What is the capital of India?"
            Button1.setTitle("Delhi", for: UIControlState.normal)
            Button2.setTitle("Kolkata", for: UIControlState.normal)
            Button3.setTitle("Balasore", for: UIControlState.normal)
            Button4.setTitle("Bhubaneswar", for: UIControlState.normal)
//            correctAnswer = "2"
            break
            
        default:
            
            break
            
        }
        
    }
    
    @IBAction func Button1Action(_ sender: Any) {
        
        if(correctAnswer==0){
            NSLog("You are correct!")
        }
        else{
            NSLog("You are wrong!")
        }
        
    }
    @IBAction func Button2Actions(_ sender: Any) {
        if(correctAnswer==1){
            NSLog("You are correct!")
        }
        else{
            NSLog("You are wrong!")
        }
    }
    @IBAction func Button3Actions(_ sender: Any) {
        if(correctAnswer==2){
            NSLog("You are correct!")
        
        }
        else{
            NSLog("You are wrong!")
        }
        
    }

    @IBAction func Btn4Action(_ sender: Any) {
        
        if(correctAnswer==3){
            NSLog("You are correct!")
    }
        else{
            NSLog("You are wrong!")
        }
    }
    @IBAction func NextQuestion(_ sender: Any) {
        
        randomQuestionDatabase()
        
    }
    
    func randomQuestionDatabase(){
        
        var rndNum = arc4random() % 5
        
        rndNum+=1
        
        let realm = try! Realm()
        
        let allData = realm.objects(DatabaseModel)
        
        QuestionLabel.text = allData[0].q1
        Button1.setTitle(allData[0].a1q1, for: UIControlState.normal)
        Button2.setTitle(allData[0].a2q1, for: UIControlState.normal)
        Button3.setTitle(allData[0].a3q1, for: UIControlState.normal)
        Button4.setTitle(allData[0].a4q1, for: UIControlState.normal)
        
        
//        for quiz in allData{
//            
//        }
        
        lastRndNum = Int(rndNum)
        
    }
}


