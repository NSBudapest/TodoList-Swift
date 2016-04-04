//
//  TodoViewKIFTests.swift
//  TodoList
//
//  Created by Vásárhelyi Ágnes on 01/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import XCTest

class TodoViewKIFTests: XCTestCase {
    
    override func setUp() {
        tester().tapViewWithAccessibilityLabel("Learn KIF 0")
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAlertPopUp() {
        tester().tapViewWithAccessibilityLabel("Done")
        tester().waitForViewWithAccessibilityLabel("..you are done with Learn KIF?")
        
        // teardown:
        tester().tapViewWithAccessibilityLabel("Cancel")
        tester().tapViewWithAccessibilityLabel("Back")
        tester().waitForViewWithAccessibilityLabel("tableView")
    }
    
    func testAlertPopUpAndPressOK() {
        tester().tapViewWithAccessibilityLabel("Done")
        tester().tapViewWithAccessibilityLabel("OK")
        tester().waitForViewWithAccessibilityLabel("tableView")
    }
    
    func testAlertPopUpAndPressCancel() {
        tester().tapViewWithAccessibilityLabel("Done")
        tester().tapViewWithAccessibilityLabel("Cancel")
        tester().waitForViewWithAccessibilityLabel("Description: Learn KIF")
        
        //teardown:
        tester().tapViewWithAccessibilityLabel("Back")
        tester().waitForViewWithAccessibilityLabel("tableView")
    }

}
