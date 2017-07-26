//
//  CreateQuiz.swift
//  QuizApp
//
//  Created by Nitish Dash on 25/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit
import Realm

class CreateQuizInit: UIViewController {
    
    @IBOutlet weak var catTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destVC : CreateQuizFinal = segue.destination as! CreateQuizFinal
        
        destVC.titleText = titleTextField.text!
        
        destVC.categoryText = catTextField.text!
        
    }
    
    
}
