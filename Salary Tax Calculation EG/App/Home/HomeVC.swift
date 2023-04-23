//
//  HomeVC.swift
//  Salary Tax Calculation (EG)
//
//  Created by Sameh on 18/04/2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func onSalaryChange(_ sender: UITextField) {
        self.calculateButton.isEnabled = self.isSalaryValid(textField: sender)
        //sender.text = Helper.formatNumber(double: Double(sender.text ?? sender.text?.replacingOccurrences(of: ",", with: "") ?? "0") ?? 0.0, withDecimals: false)
    }

    @IBAction func calculateButtonAction(_ sender: Any) {
        self.goToResultsVC()
    }
    
    private func goToResultsVC() {
        let vc = ResultVC()
        vc.grossSalary = Double(self.salaryTextField.text ?? "0") ?? 0.0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func isSalaryValid(textField: UITextField) -> Bool {
        return textField.text?.isEmpty == false && Int(textField.text ?? "0") ?? 0 > 0
    }
    
}
