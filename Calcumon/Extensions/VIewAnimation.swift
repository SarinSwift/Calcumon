//
//  VIewAnimation.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/21/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func fadingViewAnimation() {
        let animation = CATransition()
        animation.type = .fade
        animation.duration = 0.25
        self.view.window!.layer.add(animation, forKey: nil)
    }
}
