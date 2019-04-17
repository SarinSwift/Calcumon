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
        animation.duration = 0.2
        self.view.window!.layer.add(animation, forKey: nil)
    }
    
    // If previous vc is coming from Login.storyboard, use popViewController()
    // else, use dismissViewController()
    public func checkIfInNavController() {
        if let viewControllers = self.navigationController?.viewControllers {
            for vc in viewControllers {
                if vc.isKind(of: LaunchViewController.classForCoder()) {
                    self.navigationController?.popViewController(animated: false)
                    return
                }
            }
        }
        self.dismiss(animated: false, completion: nil)
    }
    
    // saved redundant code in 'SingleCategoryViewController' submitBtnTapped function
    func presentCustomAlert(message: String?) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        if let message = message {
            vc.textBody.text = message
        }
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
    
    // saved redundant code in 'Login / Signup ViewController' 
    func presentCustomAlertFromSignupPages(errorMessage: String?, message: String?) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = sb.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        if let errMessage = errorMessage {
            vc.ohnoLabel.text = errMessage
        }
        if let message = message {
            vc.textBody.text = message
        }
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
}
