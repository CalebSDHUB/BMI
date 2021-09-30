//
//  WeightClass.swift
//  BMI
//
//  Created by Caleb Danielsen on 30/09/2021.
//

// This is the 3 weight classes that we de distinguishes between.

enum WeightClass: String {
    case underweight = "Underweight"
    case normal = "Normal"
    case overweight = "Overweight"
}

enum UnderweightClass {
    case underweightSevere
    case underweightModerate
    case underweightMild
}

enum OverweightClass {
    case overweightPreObese
    case ObeseLevelI
    case ObeseLevelII
    case ObeseLevelIII
}