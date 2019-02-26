//
//  ShakingTextField.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/26/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class ShakingTextField: UITextField {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.03
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
}
