//
//  ProfileLogViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ProfileLogViewController: UIViewController {

    @IBOutlet weak var downBtn: UIButton!
    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.8699956536, green: 0.7443540692, blue: 0.8824878335, alpha: 1)
    }
    

    @IBAction func downBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
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
