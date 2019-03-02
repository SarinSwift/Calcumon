//
//  UIView+CornerRadius.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        let rect = self.bounds
        
        mask.frame = rect
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
