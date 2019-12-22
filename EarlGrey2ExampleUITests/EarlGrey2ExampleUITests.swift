//
//  EarlGrey2ExampleUITests.swift
//  EarlGrey2ExampleUITests
//
//  Created by Szymon Kazmierczak on 04/12/2019.
//  Copyright © 2019 Szymon Kazmierczak. All rights reserved.
//

import XCTest

class EarlGrey2ExampleUITests: XCTestCase {
    
  let app = XCUIApplication()
  
  override func setUp() {
    continueAfterFailure = false
    XCUIDevice.shared.orientation = .portrait
    app.launch()
  }

  func testRotationToPortrait() {
    XCUIDevice.shared.orientation = .portrait
    XCTAssertEqual(host.interfaceOrientation().isPortrait, true)
  }

  func testRotationToLandscape() {
    XCUIDevice.shared.orientation = .landscapeRight
    XCTAssertEqual(host.interfaceOrientation().isLandscape, true)
  }
  
  func testDismissingModal() {
    let showModalButton = EarlGrey.selectElement(with: grey_accessibilityLabel("Show Modal!"))
    let modalLabel = EarlGrey.selectElement(with: grey_accessibilityLabel("This is a modal!"))
    
    //show modal by tapping on the button that triggers it
    showModalButton.perform(grey_tap())
    
    //Verify modal launch button is not displayed
    showModalButton.assert(grey_notVisible())
    
    //Verify modal label is displayed
    modalLabel.assert(grey_sufficientlyVisible())
    
    // Use the white-box testing call to programatically dismiss the modal
    host.dismissModal()
    
    // Verify that the modal is dismissed and that the original View Controller is shown
    showModalButton.assert(grey_sufficientlyVisible())
  }
}

private extension XCTestCase {
  /// A variable to point to the GREYHostApplicationDistantObject since casts in Swift fail on
  /// proxy types. Hence we have to perform an unsafeBitCast.
  var host: WhiteBoxCalls {
    return unsafeBitCast(
      GREYHostApplicationDistantObject.sharedInstance,
      to: WhiteBoxCalls.self)
  }
}
