//
//  TodoTableViewKIFTests.swift
//  TodoList
//
//  Created by Vásárhelyi Ágnes on 01/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import XCTest

class TodoTableViewUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddNewItem() {
        tester().tapViewWithAccessibilityLabel("Add")
        let tableView = tester().waitForViewWithAccessibilityLabel("tableView") as? UITableView
        tester().waitForCellAtIndexPath(NSIndexPath(forRow: 3, inSection: 0), inTableView: tableView)
        
        let numberOfRows = tableView?.numberOfRowsInSection(0)
        XCTAssertEqual(numberOfRows, 4)
    }
    
    func testScrollToItem() {
        // This test should:
        // 1. add 14 items to the list
        // 2. tap on the 17th which is not visible without scrolling
        // 3. go back to the table view
    }
    
    func testSwipe() {
        // This test should:
        // 1. Delete with swipe the 10th element in the list
    }
    
}
