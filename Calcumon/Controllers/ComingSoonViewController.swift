//
//  ComingSoonViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/5/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var greatBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greatBtn.layer.cornerRadius = greatBtn.bounds.size.width / 2
    }
    
    @IBAction func greatBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
