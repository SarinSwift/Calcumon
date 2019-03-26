//
//  UserDashboardViewController.swift
//  Calcumon
//
//  Created by Lucia Reynoso on 3/19/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class UserDashboardViewController: UIViewController {
    
    let transition = CircularTransition()
    
    var welcomeText: String = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var pickCharBtn: UIButton!
    
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
        self.fadingViewAnimation()
        checkIfInNavController()
    }
    
    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        print("GET request to logout the current user")
    }
    
    @IBAction func pickBtnTapped(_ sender: UIButton) {
//        self.fadingViewAnimation()
        let story = UIStoryboard(name: "Dashboard", bundle: nil)
        guard let chooseMonVC = story.instantiateViewController(withIdentifier: "chooseMonster") as? ChooseMonsterViewController else { return }
        chooseMonVC.modalPresentationStyle = .custom
        chooseMonVC.transitioningDelegate = self
        self.present(chooseMonVC, animated: true, completion: nil)
    }
}

extension UserDashboardViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: (UIScreen.main.bounds.height - UIScreen.main.bounds.height/8))
        transition.circleColor = pickCharBtn.backgroundColor!
        
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: (UIScreen.main.bounds.height - UIScreen.main.bounds.height/8))
        transition.circleColor = pickCharBtn.backgroundColor!
        
        return transition
    }
    
}
