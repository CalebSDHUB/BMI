//
//  BMIData.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

/// Generating data for the UIPickerView wheel.
struct WheelData {

    static var weights: [Int] {
        
        var array = [Int]()
        
        for index in 50...150 {
            array.append(index)
        }
        return array
    }
    
    static var heights: [Int] {
        
        var array = [Int]()
        
        for index in 150...250 {
            array.append(index)
        }
        return array
    }
    
    static var genders: [String] {
        
        var array = [String]()
        
        for index in Gender.allCases {
            array.append(index.rawValue)
        }
        return array
    }
    
    
}

