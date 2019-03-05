//
//  ComingSoonViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/5/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.5176470588, blue: 0.8862745098, alpha: 1)
    }
    
    @IBAction func greatBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
