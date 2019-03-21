//
//  LaunchViewController.swift
//  Calcumon
//
//  Created by Lucia Reynoso on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOpacity = 0.3
        backgroundView.layer.shadowOffset = CGSize.zero
        backgroundView.layer.shadowRadius = 10
    }
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let categoryVC = story.instantiateViewController(withIdentifier: "categories") as? ViewController else { return }
        self.present(categoryVC, animated: true, completion: nil)
    }
    
    @IBAction func signupBtnTapped(_ sender: UIButton) {
        animateSignBtns()
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        animateSignBtns()
    }
    
    func animateSignBtns() {
        // animation for dismiss
        let animation = CATransition()
        animation.type = .fade
        animation.duration = 0.25
        self.view.window!.layer.add(animation, forKey: nil)
    }
}
