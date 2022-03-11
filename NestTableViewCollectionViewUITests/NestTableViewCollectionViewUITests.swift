//
//  NestTableViewCollectionViewUITests.swift
//  NestTableViewCollectionViewUITests
//
//  Created by Howard Song on 2022-02-25.
//

import XCTest

class NestTableViewCollectionViewUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    func testTableViewData() throws {
        // UI tests must launch the application that they test.
        //let app = XCUIApplication()
        //app.launch()
        //var tableView: XCUIElementQuery
        let tableView = app.tables.element
        let tableViewRows = app.tables.children(matching: .cell).count
        let table = app.tables.containing(.table, identifier: "")
        XCTAssertNotNil(tableView)
        let tableCells = tableView.cells
        XCTAssertTrue(tableCells.count > 2)
        let promise = expectation(description: "Wait for table cells")
        
        for i in 0..<tableCells.count {
            let aCell = tableCells.element(boundBy: i)
            //XCTAssertTrue(aCell.exists, "the\(i) cell is there")
            //aCell.tap()
            
            if i == tableCells.count - 1 {
                promise.fulfill()
            }
            
        }
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertTrue(true, "Completed validating the table cell")
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
