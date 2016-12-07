//
//  registervc.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/1/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class registervc: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    // Make the text boxes entries
    @IBOutlet weak var newUsernameTextField: UITextField!
    
    @IBOutlet weak var newUsernameConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        //** Save the info that the user typed into the text boxes as newUsernameTextField and newUsernameConfirmTextField
        newUsernameTextField.delegate = self
        newUsernameConfirmTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        // Becomes a first responder again
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Actions
    
    // When the user clicks register
    @IBAction func registerClicked(_ sender: UIButton) {
        
        // save the  texts as unmutable variables
        let newUsername = newUsernameTextField.text;
        let newUsernameConfirm = newUsernameConfirmTextField.text;
        
        // Check for empty fields
        if (newUsername!.isEmpty||newUsernameConfirm!.isEmpty) {
            
            // Display Alert message
            displayAlert(message: "Please fill all fields")
            
            return;
        }
        
        // Check if usernames match
        if (newUsername != newUsernameConfirm){
            
            // Display alert message
            displayAlert(message: "Usernames must match");
            
            return;
        }
        
        // Check if username is already used
        // TODO
        
        // return array with all objects stored in file path
        let allUsers = NSKeyedUnarchiver.unarchiveObject(withFile: Users.ArchiveURL.path) as! [Users]
        if allUsers != nil {
            for i in [allUsers] {
                if i.username == newUsername {
                    displayAlert(message: "Sorry, username has been used")
                }
            }
        }
        
        
    
        // Create instance of user class
        let user = Users(username: newUsername!, loggedIn: false)
        
    
        // Save the user to the file path
        let isSuccessfulSave =  NSKeyedArchiver.archiveRootObject(user as Any,toFile: Users.ArchiveURL.path)
        
        if !isSuccessfulSave {
            // Display Alert message
            displayAlert(message: "Failed to save user denewUsernameTextField.texttails")
            
            return;
        }

        
        
        

        
        // Display alert message with confirmation
        let alert = UIAlertController(title:"alert", message:"You are registered!", preferredStyle:UIAlertControllerStyle.alert);
        
        // Let the user get our of the alert message by clicking OK
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion:nil);
            };
        
        //** make the okAction be part of the allern message
        alert.addAction(okAction);
        
        //** Show the user the alert message with the ok button
        self.present(alert,animated:true, completion:nil);
        
        }
    
    // Alert message function
    func displayAlert(message:String){
        
        //** What is UAAlertController?
        let alert = UIAlertController(title:"alert", message:message, preferredStyle:UIAlertControllerStyle.alert);
        
        //** Create an action that can happen when the alert is called
        //** What is a handler? Where do we declaare an OK button
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        // Add the ok action to our alert
        alert.addAction(okAction);
        
        // Show the alert to the user
        self.present(alert, animated:true, completion:nil);
        
    }

    // MARK: NSCoding
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
