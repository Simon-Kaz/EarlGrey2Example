//
//  GREYHostApplicationDistantObject+WhiteBoxCalls.swift
//  eDOBundle
//
//  Created by Szymon Kazmierczak on 15/12/2019.
//  Copyright © 2019 Szymon Kazmierczak. All rights reserved.
//

import Foundation
import UIKit
@testable import EarlGrey2Example

extension GREYHostApplicationDistantObject: WhiteBoxCalls {

  public func interfaceOrientation() -> UIInterfaceOrientation {
    guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else {
        #if DEBUG
        fatalError("Could not obtain UIInterfaceOrientation from a valid windowScene")
        #else
        return nil
        #endif
    }
    return orientation
  }
  
  public func getRootVC() -> UIViewController {
    // Get the foreground, active scene
    let foregroundScene = UIApplication.shared.connectedScenes.filter {$0.activationState == .foregroundActive}.first!
    // get the scene delegate for the aforementioned scene
    let sceneDelegate = foregroundScene.delegate as! SceneDelegate
    
    return sceneDelegate.window!.rootViewController!
  }
  
  public func dismissModal() {
    self.getRootVC().dismiss(animated: true, completion: nil)
  }
}
