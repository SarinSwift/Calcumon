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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
