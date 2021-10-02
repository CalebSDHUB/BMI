//
//  ViewController.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

import UIKit
import GoogleMobileAds

class BMIViewController: UIViewController, GADFullScreenContentDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var BMIWheel: UIPickerView!
    @IBOutlet weak var calculateButton: UIButton!
    
    private var interstitial: GADInterstitialAd?
    
    var weight: Int?
    var height: Int?
    var gender: String?
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstitialHandler()
        
        /// Using the delegate.
        BMIWheel.dataSource = self
        BMIWheel.delegate = self
        nameField.delegate = self
        
        title = Constants.BMITitle
        
        /// Using white color for the navigation title.
        navigationController?.navigationBar.tintColor = .white
        
        /// Remove text from the NavigationItem backButton.
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        
        /// Inserting Navigation background image.
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header"), for: .default)
        
        /// Listening for changed, when textField is used
        nameField.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        
        /// Calculation buttion is disabled from the start.
        calculateButton.isEnabled = false
        
        /// Extract the initial value of the UIPickerView Wheel, without using it.
        weight = WheelData.weights[BMIWheel.selectedRow(inComponent: 0)]
        height = WheelData.heights[BMIWheel.selectedRow(inComponent: 1)]
        gender = WheelData.genders[BMIWheel.selectedRow(inComponent: 2)]
    }
    
    /// Checking that all data is avaiable before continuing.
    @objc private func formValidation() {
        guard weight != nil, height != nil, gender != nil, nameField.hasText else {
            calculateButton.isEnabled = false
            return
        }
        calculateButton.isEnabled = true
    }
    
    /// Interstitial initialization.
    private func interstitialHandler() {
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910", request: request, completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        })
    }
    
    private func runInterstitial() {
        if let interstitial = interstitial {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    /// Calculate the BMI and the CI (Ponderal Index).
    @IBAction func calculateButton(_ sender: UIButton) {
        
        /// We are able to force unwrap the four parameters because, in order to use this calculateButton function, the formValidation function makes sure that the parameters are initialized.
        /// The fifth parameter (result) needs to be unwrapped safely.
        guard let result = BMIEngine(weight!, height!).getResult() else { fatalError("Error: The Result object is not instantiated") }
        user = User(weight: weight!, height: height!, name: nameField.text!, gender: Gender(rawValue: gender!)!, result: result)
        runInterstitial()
        performSegue(withIdentifier: Constants.BMIViewControllerIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.BMIViewControllerIdentifier {
            let segueDestination = segue.destination as! BMIDetailViewController
            segueDestination.user = user
        }
    }
    
}

extension BMIViewController: UIPickerViewDataSource {
    
    /// Tell UIPickerView how many numbers of components (wheels) we want.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.numberOfPickerComponents
    }
    
    /// Tells UIPickerView how many slots there should be inside each component.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return WheelData.weights.count
        case 1:
            return WheelData.heights.count
        case 2:
            return WheelData.genders.count
        default:
            return -1
        }
    }
}

extension BMIViewController: UIPickerViewDelegate {
    
    /// We tell UIPickerView want it should display for each slot.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(WheelData.weights[row])
        case 1:
            return String(WheelData.heights[row])
        case 2:
            return WheelData.genders[row]
        default:
            return nil
        }
    }
    
    /// It listens for each component when they stop, and thereby select them.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        formValidation()
        
        switch component {
        case 0:
            weight = WheelData.weights[row]
        case 1:
            height = WheelData.heights[row]
        case 2:
            gender = WheelData.genders[row]
        default:
            print("Error: Loading the components or data")
        }
    }
}

extension BMIViewController: UITextFieldDelegate {
    
    /// Removes the keynboard when "Enter" is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.endEditing(true)
        return true
    }
}

