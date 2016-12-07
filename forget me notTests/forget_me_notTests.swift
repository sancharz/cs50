//
//  forget_me_notTests.swift
//  forget me notTests
//
//  Created by alana davitt on 11/30/16.
//  Copyright © 2016 cs50 project team. All rights reserved.
//

import XCTest
@testable import forget_me_not

class forget_me_notTests: XCTestCase {
    
    func testUserInitialization() {
        // Success case.
        let potentialItem = Users(username:"McKenna", loggedIn: false)
        XCTAssertNotNil(potentialItem)
        
        // Failure Case
        let noName = Users(username: "", loggedIn: false)
        XCTAssertNil(noName, "Empty username")
        
    }
    
}
