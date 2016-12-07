//
//  entryvc.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/1/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class entryvc: UIViewController, UITextViewDelegate {
    
    //MARK: Properties
    
    // Create a variable that will be displayed in the prompt window
    @IBOutlet weak var promptText: UILabel!
    
    //** Make the entryText box a variable so that is can be a first responder?
    @IBOutlet weak var entryText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //** IF the user does not have an entry for this day, we do not want the text ield to be here.  We just want a label that says "You already entered for today.  We may want to have an alert on the other page though.
        //** I think that this saves the input into entries as entryText?
        entryText.delegate = self
        
        //** This will create the prompt
        //** promptText = prompt where promptID = currentPrompt
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        
        // Hide the keyboard.
        textView.resignFirstResponder()
        return true
    }
    
    //MARK: Actions
    
    // Save an entry when the user clicks save
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        // TODO
        /** Create Entry
        date = current date
        promptId = currentPromptId
        entry = entryText.text
        relationship with user where loggedIn = 1
        relationship with prompt where promptId = currentPromptId
 
        // Go to next prompt for the following day
        currentPromptId = currentPromptId + 1
        if currentPromptId == 60{
            currentPromptId = 0
 
        }*/

    }

 
    //MARK: Navigation
    //** Should this be under navigation?
    // This takes the user to the myEntries page when they click the my entries button
    @IBAction func myEntriesButtonClicked(_ sender: UIButton) {
        self.shouldPerformSegue(withIdentifier: "fromEntry", sender: self)
    }

}
