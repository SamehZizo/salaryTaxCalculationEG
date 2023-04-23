//
//  ResultItemCell.swift
//  Salary Tax Calculation (EG)
//
//  Created by Sameh on 18/04/2023.
//

import UIKit

class ResultItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, amount: String) {
        self.titleLabel.text = title
        self.amountLabel.text = amount
    }
    
}
