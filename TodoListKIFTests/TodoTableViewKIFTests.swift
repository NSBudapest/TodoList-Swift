//
//  TodoTableViewKIFTests.swift
//  TodoList
//
//  Created by Vásárhelyi Ágnes on 01/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import XCTest

class TodoTableViewKIFTests: XCTestCase {
    
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
        for _ in 0...13 {
            tester().tapViewWithAccessibilityLabel("Add")
        }
        let tableView = tester().waitForViewWithAccessibilityLabel("tableView") as? UITableView
        let numberOfRows = tableView?.numberOfRowsInSection(0)
        XCTAssertEqual(numberOfRows, 18)
        
        tester().tapViewWithAccessibilityLabel("Anything else? 17")
        
        tester().tapViewWithAccessibilityLabel("Back")
        tester().waitForViewWithAccessibilityLabel("tableView")
    }
    
    func testSwipe() {
        let tableView = tester().waitForViewWithAccessibilityLabel("tableView") as? UITableView
        tester().swipeRowAtIndexPath(NSIndexPath(forRow: 10, inSection: 0), inTableView: tableView, inDirection: .Left)
        tester().tapViewWithAccessibilityLabel("Delete")
        let numberOfRows = tableView?.numberOfRowsInSection(0)
        XCTAssertEqual(numberOfRows, 17)
    }
    
}
