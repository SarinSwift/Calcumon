//
//  ProfileLogViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit
import PullToDismiss

class ProfileLogViewController: UIViewController {
    
    let transition = CircularTransition()
    var questionAnswersArrFromSingleVC = [QuestionAnswer]()
    
    var trophyImageFromPrevVC: UIImage = #imageLiteral(resourceName: "badTrophy")
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private var pullToDismiss: PullToDismiss?
    var allCorrect: Int = 0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var trophyImageView: UIImageView!
    @IBOutlet weak var scoreOutOfTenLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var viewLogBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBgGradient()
        trophyImageView.image = trophyImageFromPrevVC
        
        scoreOutOfTenLabel.text = "\(allCorrect)/10"
        setupMainLabel()
        setupCommentsLabel()
        
        pullToDismiss = PullToDismiss(scrollView: tableView)
        pullToDismiss?.backgroundEffect = BlurEffect.extraLight
        pullToDismiss?.dismissableHeightPercentage = 0.5
        pullToDismiss?.delegate = self as? UIScrollViewDelegate
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setupBgGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.colors = [#colorLiteral(red: 0.7921568627, green: 0.5176470588, blue: 0.8862745098, alpha: 1).cgColor, #colorLiteral(red: 0.4, green: 0.2588235294, blue: 0.7529411765, alpha: 1).cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setupMainLabel() {
        if 0...1 ~= allCorrect {
            mainLabel.text = "POOR"
        } else if 2...3 ~= allCorrect {
            mainLabel.text = "AVERAGE"
        } else if 4...5 ~= allCorrect {
            mainLabel.text = "GOOD"
        } else if 6...7 ~= allCorrect {
            mainLabel.text = "VERY GOOD"
        } else if 8...10 ~= allCorrect {
            mainLabel.text = "EXCELLENT"
        }
    }
    
    func setupCommentsLabel() {
        if 0...2 ~= allCorrect {
            commentsLabel.text = "You have some studying to do! Make sure to try harder next time"
        } else if 3...5 ~= allCorrect {
            commentsLabel.text = "Your scores are pretty low:( Push yourself a little more and you'll get better!"
        } else if 6...7 ~= allCorrect {
            commentsLabel.text = "You are doing good so far. Keep up the good work."
        } else if 8...10 ~= allCorrect {
            commentsLabel.text = "You have done great so far. Keep up the great work!"
        }
    }
    @IBAction func viewLogBtnTapped(_ sender: UIButton) {
        // present coming soon
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewLogsVC = story.instantiateViewController(withIdentifier: "viewLogsvcId") as? ViewLogsViewController else { return }
        viewLogsVC.questionAnswersArrFromProfileVC = questionAnswersArrFromSingleVC
        viewLogsVC.modalPresentationStyle = .custom
        viewLogsVC.transitioningDelegate = self
        self.present(viewLogsVC, animated: true, completion: nil)
    }
    
    @IBAction func signupBtnTapped(_ sender: UIButton) {
        // V2
        let story = UIStoryboard(name: "Login", bundle: Bundle.main)
        guard let signupVc = story.instantiateViewController(withIdentifier: "signupView") as? SignupViewController else { return }
        self.present(signupVc, animated: false, completion: nil)
        self.fadingViewAnimation()
        
        // V1 Singup / login not working yet
//        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let comingSoonVC = story.instantiateViewController(withIdentifier: "comingSoonVCId") as? ComingSoonViewController else { return }
//        comingSoonVC.modalPresentationStyle = .custom
//        comingSoonVC.transitioningDelegate = self
//        self.present(comingSoonVC, animated: true, completion: nil)
    }
}

extension ProfileLogViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: (UIScreen.main.bounds.height - UIScreen.main.bounds.height/8))
//        transition.circleColor = viewLogBtn.backgroundColor!
        transition.circleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: (UIScreen.main.bounds.height - UIScreen.main.bounds.height/8))
//        transition.circleColor = viewLogBtn.backgroundColor!
        transition.circleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return transition
    }
    
}
