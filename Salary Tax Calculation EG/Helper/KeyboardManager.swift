//
//  KeyboardManager.swift
//  Salary Tax Calculation EG
//
//  Created by Sameh on 20/04/2023.
//

import Foundation
import IQKeyboardManagerSwift

class KeyboardManager {
    
    class func setupIQKeyboardConfigurations() {
      IQKeyboardManager.shared.enable = true
      IQKeyboardManager.shared.keyboardDistanceFromTextField = 5
      IQKeyboardManager.shared.enableAutoToolbar = false
      IQKeyboardManager.shared.resignFirstResponder()
      IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
}
