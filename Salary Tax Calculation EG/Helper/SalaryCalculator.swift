//
//  SalaryCalculator.swift
//  Salary Tax Calculation (EG)
//
//  Created by Sameh on 18/04/2023.
//

import Foundation

class SalaryCalculator {


    private static func getTaxLayers(yearlySalary: Double) -> [[Double]] {
        var layers = [[Double]]()
        if 0 <= yearlySalary && yearlySalary < 600000 {
            layers = [[9000, 0], [15000, 0], [15000, 2.5], [15000, 10], [15000, 15], [140000, 20], [200000, 22.5], [200000, 25]]
        } else if 600000 <= yearlySalary && yearlySalary < 700000 {
            layers = [[9000, 0], [30000, 2.5], [15000, 10], [15000, 15], [140000, 20], [200000, 22.5], [300000, 25]]
        } else if 700000 <= yearlySalary && yearlySalary < 800000 {
            layers = [[9000, 0], [45000, 10], [15000, 15], [140000, 20], [200000, 22.5], [400000, 25]]
        } else if 800000 <= yearlySalary && yearlySalary < 900000 {
            layers = [[9000, 0], [60000, 15], [140000, 20], [200000, 22.5], [500000, 25]]
        } else if 900000 <= yearlySalary && yearlySalary < 1000000 {
            layers = [[9000, 0], [200000, 20], [200000, 22.5], [600000, 25]]
        } else if 1000000 <= yearlySalary {
            layers = [[9000, 0], [400000, 22.5], [yearlySalary - 400000, 25]]
        }

        return layers
    }

    static func calculateTax(monthlySalary: Double, socialInsurance: Int = 0) -> Double {
        //let yearlySalary = (monthlySalary - socialInsurance) * 12
        var yearlySalary = monthlySalary * 12
        let layers = getTaxLayers(yearlySalary: yearlySalary)
        var tax = 0.0
        for (i, _) in layers.enumerated() {
            if (yearlySalary > 0) {
                let layer = layers[i][0]
                if (yearlySalary >= layer) {
                    tax += layer * (layers[i][1] / 100)
                    yearlySalary -= layer
                } else {
                    tax += yearlySalary * (layers[i][1] / 100)
                    yearlySalary = 0
                }
            }
        }

        return tax / 12
    }

}
