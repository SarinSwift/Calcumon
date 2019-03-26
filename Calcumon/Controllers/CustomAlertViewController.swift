//
//  CustomAlertViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/23/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var textBody: UILabel!
    @IBOutlet weak var ohnoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }

}
