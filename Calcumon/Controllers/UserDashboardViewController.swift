//
//  UserDashboardViewController.swift
//  Calcumon
//
//  Created by Lucia Reynoso on 3/19/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class UserDashboardViewController: UIViewController {
    
    var welcomeText: String = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeText)"

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

    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
