//
//  ComingSoonViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 4/4/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var xBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xBtn.layer.cornerRadius = xBtn.bounds.size.width / 2
    }

    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
