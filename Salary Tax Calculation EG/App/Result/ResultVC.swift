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
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTableViewCell()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.calculate()
    }
    
    private func calculate() {
        let tax = SalaryCalculator.calculateTax(monthlySalary: self.grossSalary)
        let netSalary = self.grossSalary - tax
        
        self.items.append(Item(title: "Gross Salary", amount: "\(Helper.formatNumber(double: self.grossSalary)) EGP"))
        self.items.append(Item(title: "", amount: "-"))
        self.items.append(Item(title: "Tax", amount: "\(Helper.formatNumber(double: tax)) EGP"))
        self.items.append(Item(title: "", amount: "="))
        self.items.append(Item(title: "Net Salary", amount: "\(Helper.formatNumber(double: netSalary)) EGP"))
        
        self.tableView.reloadData()
    }

    private func setupTableViewCell() {
        self.tableView.register(UINib(nibName: "ResultItemCell", bundle: nil), forCellReuseIdentifier: "ResultItemCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultItemCell", for: indexPath) as! ResultItemCell
        let item = self.items[indexPath.row]
        cell.setData(title: item.title, amount: item.amount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
