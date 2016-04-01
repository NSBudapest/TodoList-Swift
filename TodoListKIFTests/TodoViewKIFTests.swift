//
//  TodoViewKIFTests.swift
//  TodoList
//
//  Created by Vásárhelyi Ágnes on 01/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import XCTest

class TodoViewUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAlertPopUp() {
        // This test should:
        // 1. open an item
        // 2. press done and see an alert
        // 3. go back
    }
    
    func testAlertPopUpAndPressOK() {
        // This test should:
        // 1. open an item
        // 2. press done
        // 3. select OK and see going back to list with the removed item not in being in it anymore
    }
    
    func testAlertPopUpAndPressCancel() {
        // This test should:
        // 1. open an item
        // 2. press done
        // 3. select Cancel and see the same screen
        // 4. go back
    }
    
}
