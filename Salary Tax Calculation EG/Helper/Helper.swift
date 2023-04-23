//
//  HelperMethods.swift
//  Salary Tax Calculation (EG)
//
//  Created by Sameh on 19/04/2023.
//

import Foundation

class Helper {
    
    static func formatNumber(double: Double, withDecimals: Bool = true) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true    // Enabled separator
        numberFormatter.groupingSeparator = ","         // Set the separator to "," (e.g. 1000000 = 1,000,000)
        numberFormatter.groupingSize = 3
        if withDecimals {
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
        }
        
        return numberFormatter.string(from: NSNumber(floatLiteral: double)) ?? "0"
    }
    
}
