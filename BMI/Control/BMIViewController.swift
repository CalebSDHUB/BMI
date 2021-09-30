//
//  ViewController.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

import UIKit

class BMIViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var BMIWheel: UIPickerView!
    @IBOutlet weak var calculateButton: UIButton!
    
    var weight: Int?
    var height: Int?
    var gender: String?
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using the delegate
        BMIWheel.dataSource = self
        BMIWheel.delegate = self
        
        title = Constants.BMITitle
        
        /// Using white color for the navigation title
        navigationController?.navigationBar.tintColor = .white
        
        /// Remove text from the NavigationItem backButton
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)

        /// Inserting Navigation background image
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header"), for: .default)
        
//        let user = User(weight: "234", height: "234", gender: .female)
//        print(user.gender.rawValue)
    }

    /// Calculate the BMI and the CI (Ponderal Index)
    @IBAction func calculateButton(_ sender: UIButton) {
        print(WheelData.heights.count)
    }
    
}

extension BMIViewController: UIPickerViewDataSource {
    
    /// Tell UIPickerView how many numbers of components (wheels) we want.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.numberOfpickerComponents
    }
    
    /// Tells UIPickerView how many slots there should be inside each component.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return WheelData.weights.count
        case 1:
            return WheelData.heights.count
        case 2:
            return 2
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
        
        switch component {
        case 0:
            weight = WheelData.weights[row]
        case 1:
            height = WheelData.heights[row]
        case 2:
            gender = WheelData.genders[row]
        default:
            print("Error: Loading the components")
        }
        
//        nameField.text
    }
}

