//
//  SingleCategoryViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class SingleCategoryViewController: UIViewController {

    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var solveView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var choice5: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupNavBar()
        
        // TODO: Create method getRandomQuestion() from the API
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainPage))
    }
    @objc func backToMainPage() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        // TODO: Update the view to another question!!
        //       Call getRandomQuestion()
    }
    
}
