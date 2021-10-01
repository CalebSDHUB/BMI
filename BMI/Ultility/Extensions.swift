//
//  Extensions.swift
//  BMI
//
//  Created by Caleb Danielsen on 01/10/2021.
//

import Foundation

/// Enable string retrieval by index like: title[3]
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
