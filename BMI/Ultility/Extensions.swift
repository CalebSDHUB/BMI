//
//  Extensions.swift
//  BMI
//
//  Created by Caleb Danielsen on 01/10/2021.
//

import UIKit

/// Enable string retrieval by index like: title[3]
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

/// Enable screenshot image of the UIView.
extension UIView {
    
    func screenShot() -> UIImage? {
        
        let scale = UIScreen.main.scale
        let bounds = self.bounds
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, scale)
        if let _ = UIGraphicsGetCurrentContext() {
            self.drawHierarchy(in: bounds, afterScreenUpdates: true)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            return screenshot
        } else {
            return nil
        }
    }
}
