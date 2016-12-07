//
//  onThisDayvc.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/1/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class onThisDayvc: UIViewController {

    // Declare labels as variables
    @IBOutlet weak var onBlankYouWrote: UILabel!
    
    @IBOutlet weak var onThisDayPrompt: UILabel!
    
    @IBOutlet weak var onThisDayEntry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* //** Create Labels
         
        let date = dateClicked
         
        onThisDayEntry = entry from database at onThisDay
        onThisDayPrompt = prompt from data base at onThisDay
        onBlankYouWrote = "On /(dateClicked) you Wrote..."
        
        */ */

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    //** Can we pass in the date argument?
     @IBAction func returnClicked(_ sender: UIButton) {
        self.shouldPerformSegue(withIdentifier: "fromOnThisDay", sender: self)
     }

}
