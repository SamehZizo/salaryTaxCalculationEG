//
//  ResultVC.swift
//  Salary Tax Calculation (EG)
//
//  Created by Sameh on 18/04/2023.
//

import UIKit

class ResultVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var grossSalary: Double = 0.0
    var income = [Item]()
    var deductions = [Item]()
    var takeHome = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Salary Breakdown"
        self.setupTableViewCell()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.calculate()
    }
    
    private func calculate() {
        let tax = SalaryCalculator.calculateTax(monthlySalary: self.grossSalary)
        let taxableIncome = self.grossSalary - SalaryCalculator.exemptionLimit / 12
        let monthlyExemptionLimit = SalaryCalculator.exemptionLimit / 12
        let netSalary = self.grossSalary - tax
        
        // Income
        self.income.append(Item(title: "Gross Salary", amount: "\(Helper.formatNumber(double: self.grossSalary)) EGP"))
        //self.income.append(Item(title: "Taxable Income", amount: "\(Helper.formatNumber(double: taxableIncome)) EGP"))
        //self.income.append(Item(title: "Personal Allowance", amount: "\(Helper.formatNumber(double: monthlyExemptionLimit)) EGP"))
        //self.items.append(Item(title: "", amount: "-"))
        
        // Deductions
        self.deductions.append(Item(title: "Tax", amount: "\(Helper.formatNumber(double: tax)) EGP"))
        //self.deductions.append(Item(title: "Social Insurance", amount: "Comming Soon ..."))
        //self.items.append(Item(title: "", amount: "="))
        
        // Take Home
        self.takeHome.append(Item(title: "Net Salary", amount: "\(Helper.formatNumber(double: netSalary)) EGP"))
        
        self.tableView.reloadData()
    }

    private func setupTableViewCell() {
        self.tableView.register(UINib(nibName: "ResultItemCell", bundle: nil), forCellReuseIdentifier: "ResultItemCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.income.count
        case 1:
            return self.deductions.count
        case 2:
            return self.takeHome.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: Item!
        switch indexPath.section {
        case 0:
            item = self.income[indexPath.row]
            break
        case 1:
            item = self.deductions[indexPath.row]
            break
        case 2:
            item = self.takeHome[indexPath.row]
            break
        default:
            break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultItemCell", for: indexPath) as! ResultItemCell
        cell.setData(title: item.title, amount: item.amount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Income"
        case 1:
            return "Deductions"
        case 2:
            return "Take Home"
        default:
            return ""
        }
    }

}

struct Item {
    
    let title: String
    let amount: String
    
    init(title: String, amount: String) {
        self.title = title
        self.amount = amount
    }
    
}
