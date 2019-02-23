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
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupNavBar()
        callingEquations()
    }
    
    func callingEquations() {
        if self.title == "Addition" {
            getRandomAdd()
        } else if self.title == "Subtraction" {
            getRandomSub()
        } else if self.title == "Multiplication" {
            getRandomMul()
        } else if self.title == "Division" {
            getRandomDiv()
        } else if self.title == "Addtion & Subtraction" {
            getRandomAddSub()
        } else if self.title == "Division & Mulitplication" {
            getRandomDivMul()
        } else if self.title == "Basic Math" {
            getRandomBasMath()
        }
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainPage))
    }
    @objc func backToMainPage() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func getRandomAdd() {
        let randomEquation = MathExpression.randomAddition().description
        questionLabel.text = randomEquation
    }
    
    func getRandomSub() {
        let randomEquation = MathExpression.randomSubtract().description
        questionLabel.text = randomEquation
    }
    
    func getRandomMul() {
        let randomEquation = MathExpression.randomMultiply().description
        questionLabel.text = randomEquation
    }
    
    func getRandomDiv() {
        let randomEquation = MathExpression.randomDivide().description
        questionLabel.text = randomEquation
    }
    
    func getRandomAddSub() {
        let randomEquation = MathExpression.randomAddSubtract().description
        questionLabel.text = randomEquation
    }
    
    func getRandomDivMul() {
        let randomEquation = MathExpression.randomDivMultiply().description
        questionLabel.text = randomEquation
    }
    
    func getRandomBasMath() {
        let randomEquation = MathExpression.random().description
        questionLabel.text = randomEquation
    }
    
    
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        // Update the questionLabel to another problem
        callingEquations()
    }
    
}
