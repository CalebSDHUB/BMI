//
//  BMIDetailViewController.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

import UIKit
import GoogleMobileAds

class BMIDetailViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var integerBMILabel: UILabel!
    @IBOutlet weak var decimalBMILabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var BMIRangeLabel: UILabel!
    @IBOutlet weak var CILabel: UILabel!
    @IBOutlet weak var bannerView: GADBannerView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.BMIDetailTitle
        
        bannerHandler()
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
        
        messageLabel.text = "HELLO \(user.name.uppercased()), YOU ARE \(user.result.weightClass.rawValue.uppercased())"
        BMIRangeLabel.text = "Normal BMI Range: \(user.result.bmiRangeInfo)"
        CILabel.text = "Ponderal Index: \(String(format: "%.2f" , user.result.ciValue))kg/m3"
    }
    
    /// Banner initialization
    private func bannerHandler() {
        
        /// Banner Admob initialization.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        /// Custom, banner size. The banner image is adjusted to the size of the GADBannerView.
        bannerView.adSize = GADAdSizeFromCGSize(CGSize(width: bannerView.frame.width, height: bannerView.frame.height))
    }

    @IBAction func shareButton(_ sender: UIButton) {
        
    }
    @IBAction func rateButton(_ sender: UIButton) {
        
    }
}
