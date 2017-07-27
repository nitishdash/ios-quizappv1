//
//  LoginVC.swift
//  QuizApp
//
//  Created by Nitish Dash on 27/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var credentialStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        credentialStatus.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text

        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if(userEmailStored == userEmail){
            
            if(userPasswordStored == userPassword){
            //successful login
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            
            self.dismiss(animated: true, completion: nil)
            }
    }
        else
        {
            credentialStatus.isHidden = false
        }


}
}
