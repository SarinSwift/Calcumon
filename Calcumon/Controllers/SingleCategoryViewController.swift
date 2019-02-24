//
//  SingleCategoryViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class SingleCategoryViewController: UIViewController {

    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var solveView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupNavBar()
        callingEquations()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let answerInput = answerTextField.text else {
            // TODO: check the answer with Wolfram API
            return print("no answer yet")
        }
        if answerInput == "" {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            // Not hiding the navBar??
            vc.navigationController?.navigationBar.isHidden = true
            self.addChild(vc)
            self.view.addSubview(vc.view)
            
        } else {
            print(answerInput)
        }
    }
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        self.answerTextField.resignFirstResponder()
    }
    @IBAction func swipeToHideKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.answerTextField.resignFirstResponder()
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
        } else if self.title == "Addition & Subtraction" {
            getRandomAddSub()
        } else if self.title == "Division & Mulitplication" {
            getRandomDivMul()
        } else if self.title == "Basic Math" {
            getRandomBasMath()
        } else if self.title == "Square Root" {
            getRandomRoot()
        } else if self.title == "Linear Equation" {
            instructionsLabel.text = "Solve for X"
            getRandomLinearEq()
        } else if self.title == "Radicals" {
            getRandomRad()
        }
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainPage))
    }
    @objc func backToMainPage() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func getRandomAdd() {
        let randInt = Int.random(in: 0...1)
        // chosing either 2 equations, or one simple equation
        if randInt == 0 {
            let randomEquation = MathExpression.randomAddition()
            questionLabel.text = randomEquation.description
        } else {
            let randomEquation = MathExpression(lhs: .Expression(expression: MathExpression.randomAddition()), rhs: .Expression(expression: MathExpression.randomAddition()), operator: .plus)
            questionLabel.text = randomEquation.description
        }
        
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
    
    func getRandomRoot() {
        let randInt = MathElement.Root(value: Int.random(in: 1...30))
        questionLabel.text = randInt.nsExpressionFormatString
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
    
    func getRandomLinearEq() {
        let randomEquation = MathExpression.randomLinear().descriptionLinear
        questionLabel.text = randomEquation
    }
    
    func getRandomRad() {
        let randomEquation = MathExpression.randomAddRadicals()
        questionLabel.text = randomEquation.description
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        // Update the questionLabel to another problem
        callingEquations()
    }
    
}
