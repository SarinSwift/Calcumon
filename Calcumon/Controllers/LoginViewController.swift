//
//  LoginViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/19/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        loginView.layer.cornerRadius = 10
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOpacity = 0.3
        loginView.layer.shadowOffset = CGSize.zero
        loginView.layer.shadowRadius = 10
    }

    @IBAction func loginBtnTapped(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let categoryVC = story.instantiateViewController(withIdentifier: "categories") as? ViewController else { return }
        self.present(categoryVC, animated: true, completion: nil)
    }
}
