//
//  TodoListUITests.swift
//  TodoListUITests
//
//  Created by Vásárhelyi Ágnes on 02/04/16.
//  Copyright © 2016 NSBudapest. All rights reserved.
//

import XCTest

class TodoListUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddNewItem() {
        let app = XCUIApplication()
        app.navigationBars["Todos"].buttons["Add"].tap()
        app.tables["tableView"].staticTexts["Anything else?"].tap()
    }
    
    func testScroll() {
        
        let app = XCUIApplication()
        let addButton = app.navigationBars["Todos"].buttons["Add"]
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        
        let tableviewTable = app.tables["tableView"]
        tableviewTable.cells["Anything else? 20"].staticTexts["Anything else?"].swipeUp()
        tableviewTable.cells["Anything else? 20"].staticTexts["Anything else?"].tap()
        
    }
    
    func testSwipe() {
        
        let app = XCUIApplication()
        app.navigationBars["Todos"].buttons["Add"].tap()
        
        let tableviewTable = app.tables["tableView"]
        let cell = tableviewTable.cells["Anything else? 3"]
        
        let exists = NSPredicate(format: "exists == true")
        expectationForPredicate(exists, evaluatedWithObject: cell, handler: nil)
        
        cell.swipeLeft()
        tableviewTable.buttons["Delete"].tap()
        
        waitForExpectationsWithTimeout(3, handler: nil)
        XCTAssert(!cell.exists)
    }
    
}
