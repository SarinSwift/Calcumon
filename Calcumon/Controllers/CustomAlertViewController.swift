//
//  CustomAlertViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/23/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Not hiding the navBar??
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }

}
