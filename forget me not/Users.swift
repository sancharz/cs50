//
//  Users.swift
//  forget me not
//
//  Created by McKenna Roberts on 12/5/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import UIKit

class Users: NSObject, NSCoding {
    
    // MARK: Properties
    
    
    // Create a variable for username that is unique
    var username: String
    
    // Create bool that will equal one if user is logged in and equal zero otherwise
    var loggedIn: Bool
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")
    
    // MARK: Initialization
    
    init?(username: String, loggedIn: Bool){
        
        // set initial values for each property
        self.username = username
        self.loggedIn = false
        
        //call to the superclass' initializer
        super.init()
        
        // if initialization fails or no username is given
        if username.isEmpty {
            return nil
        }
    }
    
    // MARK: Types
    
    // create struct that will hold the key names for the class Users
    struct PropertyKey {
        
        // Create the strings for the keys
        static let userKey = "username"
        static let loggedInKey = "loggedIn"
    }
    
    // MARK: NSCoding
    
    // declare the funtion of encodeWithCoder which will prep the data to be cached
    func encode(with aCoder: NSCoder){
        
        // prep username
        aCoder.encode(username, forKey: PropertyKey.userKey)
        // prep loggedIn
        aCoder.encode(loggedIn, forKey: PropertyKey.loggedInKey)
    }
    
    // intitialize the class (failable)
    required convenience init?(coder aDecoder: NSCoder) {
        
        // initialize username
        let username = aDecoder.decodeObject(forKey: PropertyKey.userKey) as! String
        // initialize loggedIn
        let loggedIn = aDecoder.decodeObject(forKey: PropertyKey.loggedInKey) as! Bool
        
        self.init(username: username, loggedIn: loggedIn)
    }
    
}


