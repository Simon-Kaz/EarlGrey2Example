//
//  EarlGrey2ExampleUITests.swift
//  EarlGrey2ExampleUITests
//
//  Created by Szymon Kazmierczak on 04/12/2019.
//  Copyright © 2019 Szymon Kazmierczak. All rights reserved.
//

import XCTest

class EarlGrey2ExampleUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        EarlGrey.selectElement(with: grey_keyWindow())
          .perform(grey_tap())
    }
}
