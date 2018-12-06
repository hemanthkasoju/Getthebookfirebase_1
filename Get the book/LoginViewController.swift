//
//  ViewController.swift
//  Get the book
//
//  Created by Pratheeksha Ravindra Naik on 2018-12-04.
//  Copyright © 2018 Hemanth Kasoju. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userEmail = userNameTextField.text;
        let password = passwordTextField.text;
        
        //Check for empty fields
        if((userEmail?.isEmpty)! || (password?.isEmpty)!)
        {
            displayAlertMessage("All feilds are required.");
            return;
        }
        
        // Storing the data
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let passwordStored = UserDefaults.standard.string(forKey: "password")
        
        if(userEmailStored == userEmail)
        {
            if(passwordStored == password)
            {
                //Login successful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize();
                performSegue(withIdentifier: "librarianView", sender: self)
            }
        }
        
    }
    
    func displayAlertMessage(_ userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "userView"
            {
                let viewController = segue.destination as! UserViewController
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dismiss the keyboard when the user taps anywhere on the screen
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
       
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

