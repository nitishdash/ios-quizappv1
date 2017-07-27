//
//  ScoreVC.swift
//  QuizApp
//
//  Created by Nitish Dash on 26/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!

    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(score)%"
        
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    
    @IBAction func backToHomeButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backToHome", sender: Any?.self)
        
    }
}
