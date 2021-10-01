//
//  BMIDetailViewController.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

import UIKit

class BMIDetailViewController: UIViewController {

    @IBOutlet weak var integerBMILabel: UILabel!
    @IBOutlet weak var decimalBMILabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var BMIRangeLabel: UILabel!
    @IBOutlet weak var CILabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.BMIDetailTitle
        displayHandler()
    }
    
    /// Display all the BMI and CI information related to User.
    private func displayHandler() {
        
        guard let user = user else { fatalError("Error: User object is not initialized.") }
        
        let formatNumber = String(format: "%.2f", user.result.bmiValue)
        let seperatedNumber = formatNumber.components(separatedBy: ".")
        let integerPart = seperatedNumber[0]
        let decimalPart = seperatedNumber[1]
        let truncatedDecimalPart = decimalPart[0] + decimalPart[1]

        integerBMILabel.text = integerPart
        decimalBMILabel.text = truncatedDecimalPart
    }

    @IBAction func shareButton(_ sender: UIButton) {
        
    }
    @IBAction func rateButton(_ sender: UIButton) {
        
    }
}
