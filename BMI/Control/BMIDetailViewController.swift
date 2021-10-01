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
    }

    @IBAction func shareButton(_ sender: UIButton) {
        
    }
    @IBAction func rateButton(_ sender: UIButton) {
        
    }
}
