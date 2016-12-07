//
//  myEntriesvc.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/1/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class myEntriesvc: UIViewController {
    
    // Make the date scroll a variable
    @IBOutlet weak var datesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    // What happens when a user clicks log out
    @IBAction func logoutClicked(_ sender: UIButton) {
        
        //** Set user.loggedIn = 0
        // Go to log in screen
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
