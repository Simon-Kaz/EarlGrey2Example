//
//  WhiteBoxCalls.swift
//  EarlGrey2Example
//
//  Created by Szymon Kazmierczak on 15/12/2019.
//  Copyright © 2019 Szymon Kazmierczak. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol WhiteBoxCalls {

  /// Obtain the host application's interface orientation.
  func interfaceOrientation() -> UIInterfaceOrientation
  
  /// Get Root View Controller
  func getRootVC() -> UIViewController
  
  /// Dismiss modal shown over current root view controller
  func dismissModal()
}
