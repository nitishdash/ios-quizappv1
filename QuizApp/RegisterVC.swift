//
//  RegisterVC.swift
//  QuizApp
//
//  Created by Nitish Dash on 27/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var repeatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func register(_ sender: Any) {
        
        let userEmail = usernameTextField.text
        let userPassword = passwordTextField.text
        let userRepeatPassword = repeatTextField.text
        
        // Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            
            // Display alert message
            
            displayMyAlertMessage(userMessage: "All fields are required");
            
            return;
        }
        
        //Check if passwords match
        if(userPassword != userRepeatPassword)
        {
            // Display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return;
            
        }
        
        
        
        
        // Store data
//        let myUser:PFUser = PFUser();
//        
//        myUser.username = userEmail
//        myUser.password = userPassword
//        myUser.email = userEmail

        UserDefaults.standard.set(userEmail, forKey:"userEmail")
        UserDefaults.standard.set(userPassword, forKey:"userPassword")

        UserDefaults.standard.synchronize()
        
        
        
            print("User successfully registered")
            
            // Display alert message with confirmation.
            let myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            
            self.dismiss(animated: true, completion:nil);
            }
            
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true, completion:nil);
            
            
      
        
        
        
        
        
        
    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
        
    }
    
    @IBAction func iHaveAnAccountButtonTapped(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
