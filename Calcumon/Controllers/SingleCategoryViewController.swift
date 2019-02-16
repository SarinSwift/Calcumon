//
//  SingleCategoryViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class SingleCategoryViewController: UIViewController {
    
    // Data that is similar to what we get from the API
    // TODO: When calling the API, we need to convert from mathML markup to the actual equation in text form
    var mockData: Equation = Equation(id: "pccnpg",
                                      question: "<mn>2<\\/mn><mi>x<\\/mi><mo> - <\\/mo><mn>1<\\/mn><mo> = <\\/mo><mn>5<\\/mn>",
                                      choice: ["<math><mo>-<\\/mo><mn>4<\\/mn><\\/math>",
                                                "<math><mn>4<\\/mn><\\/math>",
                                                "<math><mo>-<\\/mo><mn>10<\\/mn><\\/math>",
                                                "<math><mn>3<\\/mn><\\/math>",
                                                "<math><mn>1<\\/mn><\\/math>"
                                                ],
                                      correctChoice: 3,
                                      instruction: "Solve for x")

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
        
        getRandomQuestion()
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainPage))
    }
    @objc func backToMainPage() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // currently using mockData
    func getRandomQuestion() {
        questionLabel.text = mockData.question
        choice1.setTitle(mockData.choice[0], for: .normal)
        choice2.setTitle(mockData.choice[1], for: .normal)
        choice3.setTitle(mockData.choice[2], for: .normal)
        choice4.setTitle(mockData.choice[3], for: .normal)
        choice5.setTitle(mockData.choice[4], for: .normal)
    }

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        // TODO: Update the view to another question!!
        getRandomQuestion()
    }
    
}
