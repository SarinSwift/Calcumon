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
        
        setupBgGradient()
    }
    
    func setupBgGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.colors = [#colorLiteral(red: 0.7921568627, green: 0.5176470588, blue: 0.8862745098, alpha: 1).cgColor, #colorLiteral(red: 0.4, green: 0.2588235294, blue: 0.7529411765, alpha: 1).cgColor]
        view.layer.insertSublayer(gradient, at: 0)
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
