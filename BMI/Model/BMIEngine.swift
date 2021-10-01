//
//  BMIEngine.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

struct BMIEngine {
    
    private var result: Result?
    
    init(_ weight: Int, _ height: Int) {
        compute(weight, height)
    }
    
    /// Compute the BMI-value, CI-value and define the BMI range.
    private mutating func compute(_ weight: Int, _ height: Int) {
        
        /// Divide the height by 100 so we get meters, for the right units.
        let heightMeter = Float(height)/100
        
        /// Computing the Body Mass Index and the Corpulence index, aka. Ponderal Index
        let bmiValue = Float(weight) / Float( heightMeter * heightMeter )
        let ciValue = Float(weight) / Float( heightMeter * heightMeter * heightMeter )
        
        if bmiValue < 16.0 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "0kg/m2 - 15.9kg/m2", ciValue: ciValue, weightClass: .underweight)
        } else if bmiValue < 17.0 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "16kg/m2 - 16.9kg/m2", ciValue: ciValue, weightClass: .underweight)
        } else if bmiValue < 18.5 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "17.0kg/m2 - 18.4kg/m2", ciValue: ciValue, weightClass: .underweight)
        } else if bmiValue < 25.0 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "18.5kg/m2 - 24.9kg/m2", ciValue: ciValue, weightClass: .normal)
        } else if bmiValue < 30.0 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "25kg/m2 - 29.9kg/m2", ciValue: ciValue, weightClass: .overweight)
        } else if bmiValue < 35.0 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "30.0kg/m2 - 34.9kg/m2", ciValue: ciValue, weightClass: .overweight)
        } else if bmiValue < 40.0 {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "35.0kg/m2 - 39.9kg/m2", ciValue: ciValue, weightClass: .overweight)
        } else {
            result = Result(bmiValue: bmiValue, bmiRangeInfo: "≥ 40kg/m2", ciValue: ciValue, weightClass: .overweight)
        }
    }
    
    /// Return the result object, containing all nesessary computed information
    func getResult() -> Result? {
        return result
    }
    
}
