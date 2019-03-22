//
//  SingleCatVCRandomEquations.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/1/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

extension SingleCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            getRandomLinearEq()
        } else if self.title == "Radicals" {
            getRandomRad()
        } 
    }
    
    func getRandomAdd() {
        let randomEquation = MathExpression.randomAddition()
        result = randomEquation.result as! NSNumber
        questionLabel.text = randomEquation.description
    }
    
    func getRandomSub() {
        let randomEquation = MathExpression.randomSubtract()
        result = randomEquation.result as! NSNumber
        questionLabel.text = randomEquation.description
    }
    
    func getRandomMul() {
        let randomEquation = MathExpression.randomMultiply()
        result = randomEquation.result as! NSNumber
        questionLabel.text = randomEquation.description
    }
    
    func getRandomDiv() {
        let randomEquation = MathExpression.randomDivide()
        let longNumber = randomEquation.result as! Double
        result = longNumber.roundTo(places: 2) as NSNumber
        questionLabel.text = randomEquation.description
    }
    
    func getRandomRoot() {
        let value = Int.random(in: 1...30)
        let randInt = MathElement.Root(value: value)
        let sqrtNumber = sqrt(Double(value))
        result = Double(sqrtNumber).roundTo(places: 2) as NSNumber
        questionLabel.text = randInt.nsExpressionFormatString
    }
    
    func getRandomAddSub() {
        let randomInt = Int.random(in: 1...2)
        if randomInt == 1 {
            getRandomAdd()
        } else {
            getRandomSub()
        }
    }
    
    func getRandomDivMul() {
        let randomInt = Int.random(in: 1...2)
        if randomInt == 1 {
            getRandomDiv()
        } else {
            getRandomMul()
        }
    }
    
    func getRandomBasMath() {
        let randomInt = Int.random(in: 1...4)
        if randomInt == 1 {
            getRandomAdd()
        } else if randomInt == 2 {
            getRandomSub()
        } else if randomInt == 3 {
            getRandomMul()
        } else {
            getRandomDiv()
        }
    }
    
    func getRandomLinearEq() {
        let randomEquation = MathExpression.randomLinear()
        // order of setting the question label must be here! before we find the result with the following method
        questionLabel.text = randomEquation.descriptionLinear
        
        // This linear equation only works if it is the plus operator not other operators!!
        let resultOfX = (Double(randomEquation.afterEqSign) - Double(randomEquation.rhs.description)!) / Double(randomEquation.lhs.description)!
        print("result of x: \(resultOfX)")
        result = NSNumber(value: resultOfX.roundTo(places: 2))
        
    }
    
    func getRandomRad() {
        let randomEquation = MathExpression.randomAddRadicals()
        questionLabel.text = randomEquation.description
        
        let afterRoot = randomEquation.lhs.description.range(of: "√")
        let leftAfter = randomEquation.lhs.description[(afterRoot?.upperBound...)!]  // prints ints after the √
        let rightAfter = randomEquation.rhs.description[(afterRoot?.upperBound...)!]
        let sqrtNumberLeft = sqrt(Double(leftAfter)!)
        let sqrtNumberRight = sqrt(Double(rightAfter)!)
        result = (sqrtNumberLeft + sqrtNumberRight).roundTo(places: 2) as NSNumber
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionAnswersArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(questionAnswersArr.count)
        let  cell = tableView.dequeueReusableCell(withIdentifier: "questionLogCell", for: indexPath) as! QuestionLogCell
        print("tableview cellforrowat: \(questionAnswersArr[0].answer)")
        cell.questionLabel.text = questionAnswersArr[indexPath.row].question
        cell.answerLabel.text = questionAnswersArr[indexPath.row].answer
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // needs to be called when submit button is tapped
    func insertNewAnswerSet(q: String, a: String) {
        let newSet = QuestionAnswer(question: q, answer: a)
        questionAnswersArr.append(newSet)
        let indexPath = IndexPath(row: questionAnswersArr.count-1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
}
