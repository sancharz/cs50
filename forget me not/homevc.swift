//
//  entryDonevc.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/1/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class entryDonevc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    @IBAction func myEntriesClicked(_ sender: UIButton) {
        
        // Go to myEntries page when clicked
        self.shouldPerformSegue(withIdentifier: "fromEntryDone", sender: self)
    }
    
    @IBAction func submitTodaysEntryClicked(_ sender: UIButton) {
        //** Somehow we have to be able to check if there is an entry for this date
        // Go to entry page
        self.shouldPerformSegue(withIdentifier: "goToEntry", sender: self)
    }

}
