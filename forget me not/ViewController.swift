//
//  ViewController.swift
//  forget me not
//
//  Created by alana davitt on 11/30/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate  {
    
       // MARK: Properties
    
    // Declare the usernameTextField as a text field
    @IBOutlet weak var usernameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        // make the username text field a first responder
        usernameTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    // MARK: Actions
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        // save the user's username input as username
        let username = usernameTextField.text
        
        // If the uer did not put in a username, then show them an error message
        if (username == nil){
            displayAlert(message:"Please enter a username!")
        }

        
        // return array with all objects stored in file path
        let allUsers = NSKeyedUnarchiver.unarchiveObject(withFile: Users.ArchiveURL.path) as? [Users]
        if allUsers != nil {
            for i in (allUsers)! {
                
                // if the user exists
                if i.username == username {
                    
                    // Change loggedIn bool
                    print(i.loggedIn)
                    
                    i.loggedIn = true
                    
                    // go to the loggedIn page
                    self.shouldPerformSegue(withIdentifier: "logInSucessful", sender: self)
                    break
                }
            }
        }
        
        // Login not successful
        displayAlert(message: "This username is not registered!");

    }
    
    // If newUserButton is clicked, then go to the registration page
    @IBAction func newUserButton(_ sender: UIButton) {
        self.shouldPerformSegue(withIdentifier: "clickedNewUser", sender: self)
    }
    
    //** This is the same function from the register page (should we put it someplace else so that we can access it from both viewControllers?)
    func displayAlert(message:String){
        let alert = UIAlertController(title:"alert", message:message, preferredStyle:UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated:true, completion:nil);
        
    }
}
