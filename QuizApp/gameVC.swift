//
//  gameVC.swift
//  QuizApp
//
//  Created by Nitish Dash on 27/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit

class gameVC: UIViewController {

    @IBAction func logoutButton(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if (!isUserLoggedIn)
        {
            
        self.performSegue(withIdentifier: "loginView", sender: Any?.self)
        }
        
    }
    

}
