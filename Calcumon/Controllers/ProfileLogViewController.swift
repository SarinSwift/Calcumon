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

    private var pullToDismiss: PullToDismiss?
    var allCorrect: Int = 0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var scoreOutOfTenLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBgGradient()
        
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
    
    @IBAction func menuBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
