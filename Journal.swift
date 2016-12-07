//
//  Journal.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/5/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class Journal: NSObject, NSCoding {
    
    // MARK: Properties
    
    // username of the current user
    var jUsername: String
    
    // date that the entry was made
    var date: Date
    
    // what the user typed
    var entry: String
    
    // promptId of the prompt
    var promptId: Int
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("journal")
    

    
    // MARK: Initialization
    
    init?(jUsername: String, date:Date, entry: String, promptId: Int) {
        
        // Set initial properties
        self.jUsername = jUsername
        
        //** NOT SURE IF THIS WILL GIVE US THE DATE!!
        
        self.date = NSDate() as Date
        self.entry = entry
        self.promptId = 0
        
        super.init()
        
        // if initialization fails or not all of the values are input
        if jUsername.isEmpty || entry.isEmpty {
            return nil
        }
    }
    
    // MARK: Types
    
    // create struct that will hold the key names for the class Users
    struct PropertyKey {
        
        // Create the strings for the keys
        static let jUserKey = "jUsername"
        static let dateKey = "date"
        static let entryKey = "entry"
        static let promptIdKey = "promptId"
        
    }
    
    // MARK: NSCoding
    
    // declare the funtion of encodeWithCoder which will prep the data to be cached
    func encode(with aCoder: NSCoder){
        
        // prep jUsername
        aCoder.encode(jUsername, forKey: PropertyKey.jUserKey)
        // prep date
        aCoder.encode(date, forKey: PropertyKey.dateKey)
        // prep entry
        aCoder.encode(entry, forKey: PropertyKey.entryKey)
        // prep promptId
        aCoder.encode(promptId, forKey: PropertyKey.promptIdKey)
    }
    
    // intitialize the class (failable)
    required convenience init?(coder aDecoder: NSCoder) {
        
        // initialize jUsername
        let jUsername = aDecoder.decodeObject(forKey: PropertyKey.jUserKey) as! String
        // initialize date
        let date = aDecoder.decodeObject(forKey: PropertyKey.dateKey) as! Date
        // initialize entry
        let entry = aDecoder.decodeObject(forKey: PropertyKey.entryKey) as! String
        // initialize promptId
        let promptId = aDecoder.decodeObject(forKey: PropertyKey.promptIdKey) as! Int
        
        self.init(jUsername: jUsername, date: date, entry: entry, promptId: promptId)
    }
    

}
