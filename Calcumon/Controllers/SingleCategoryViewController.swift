//
//  SingleCategoryViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class SingleCategoryViewController: UIViewController, UITextFieldDelegate {
    
    // results of the math equation, and total sum of points!!
    var result: NSNumber = 0
    var pointsResult: Int = 0 {
        didSet {
            pointsLabel.text = "Score: \(pointsResult)"
        }
    }
    // variable for keeping count until user hits 10
    var numberOfEquations: Int = 0
    var correctAnswers: Int = 0
    
    // storing question&answer to populate the tableview 
    var questionAnswersArr = [QuestionAnswer]()
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var solveView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var plusPoints: UILabel!
    
    @IBOutlet weak var answerTextField: ShakingTextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        keyboardListenEvents()
        setNegativeSign()
        
        // Reading and updating the points score
        let pointsDefault = UserDefaults.standard
        if pointsDefault.value(forKey: "points") != nil {
            pointsResult = pointsDefault.value(forKey: "points") as! Int
            pointsLabel.text = "Score: \(pointsResult)"
        }
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupNavBar()
        callingEquations()
        print("viewdidload method result is: \(result)")
        plusPoints.alpha = 0
    }
    
    func setNegativeSign() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        flexibleSpace.width = (UIScreen.main.bounds.width / 3) / 3
        let negativeBtn = UIBarButtonItem(title: "-", style: .plain, target: self, action: #selector(self.negativeClicked))
        negativeBtn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let font = UIFont(name: "Arial", size: 30)
        negativeBtn.setTitleTextAttributes([NSAttributedString.Key.font: font as Any], for: .normal)
        toolBar.setItems([flexibleSpace, negativeBtn], animated: false)
        answerTextField.inputAccessoryView = toolBar
    }
    
    @objc func negativeClicked() {
        answerTextField.insertText("-")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.answerTextField.becomeFirstResponder()
    }
    
    func keyboardListenEvents() {
        // listen for keyboard events
        answerTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    deinit {
        // stop listen from keyboard hide/show events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let answerInput = answerTextField.text else {
            return 
        }
        print(result)
        if answerInput == "" {
            self.presentCustomAlert(message: nil)
            
        } else if answerInput.isContainsLetters {
            self.presentCustomAlert(message: "Answer must only contain numbers!")
        } else if let _ = Double(answerInput) {
            // Checking answer
            if answerInput == "\(self.result)" {
                // Answer was correct
                self.answerTextField.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                self.answerTextField.layer.cornerRadius = 4.5
                self.answerTextField.layer.borderWidth = 2.0
                self.pointsResult += 10
                
                // inserting the new set of answered question
                insertNewAnswerSet(q: questionLabel.text!, a: answerTextField.text!, correctness: #imageLiteral(resourceName: "correct"))
                
                // bring up new question
                continueNext()
                
                // Animate the pointsLabel
                animatePointsPopUp(points: "+10", stateColor: #colorLiteral(red: 0.2745098039, green: 0.4941176471, blue: 0.1411764706, alpha: 1))
                
                // Settign data in Userdefaults for the pointsLabel
                UserDefaultsHelp.setPoints(points: pointsResult)
                
                numberOfEquations += 1
                correctAnswers += 1
            } else {
                // Answer was incorrect
                insertNewAnswerSet(q: questionLabel.text!, a: answerTextField.text!, correctness: #imageLiteral(resourceName: "wrong"))
                
                self.answerTextField.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                self.answerTextField.layer.cornerRadius = 4.5
                self.answerTextField.layer.borderWidth = 2.0
                self.answerTextField.shake()
                self.answerTextField.text = ""
                self.answerTextField.placeholder = "Answer"
                self.pointsResult -= 5
                
                // Animate the pointsLabel
                animatePointsPopUp(points: "-5", stateColor: #colorLiteral(red: 1, green: 0.3294117647, blue: 0.2705882353, alpha: 1))
                
                // Setting data in Userdefaults for the pointsLabel
                UserDefaultsHelp.setPoints(points: pointsResult)
                
                numberOfEquations += 1
            }
            
            // When users have answered up to 10 times:
            if numberOfEquations == 10 {
                
                // TODO: pass data from 'questionAnswersArr' to this viewController
                
                let story = UIStoryboard(name: "Main", bundle: Bundle.main)
                guard let profileVC = story.instantiateViewController(withIdentifier: "profileLog") as? ProfileLogViewController else { return }
                profileVC.allCorrect = correctAnswers
                // setting the trophy if you get more than 50% correct
                if correctAnswers >= 5 {
                    profileVC.trophyImageFromPrevVC = #imageLiteral(resourceName: "trophy")
                }
                profileVC.questionAnswersArrFromSingleVC = questionAnswersArr
                profileVC.modalPresentationStyle = .overCurrentContext
                self.present(profileVC, animated: true, completion: nil)
                numberOfEquations = 0
                correctAnswers = 0
            }
            
        } else {
            // all other types that are invalid inputs ex. -9-, ---
            self.presentCustomAlert(message: "Invalid Input")
        }
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            // bringing keybourd up with the following height
            view.frame.origin.y = -(keyboardRect.height/3 - 30)
        } else {
            view.frame.origin.y = 0
        }
    }
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        self.answerTextField.resignFirstResponder()
    }
    @IBAction func swipeToHideKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.answerTextField.resignFirstResponder()
    }
    
    func setupNavBar() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainPage))
        backButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func backToMainPage() {
        self.fadingViewAnimation()
        self.navigationController?.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func skipPressed(_ sender: UIButton) {
        // Update the questionLabel to another problem
        callingEquations()
        answerTextField.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        answerTextField.layer.borderWidth = 1
        answerTextField.text = ""
        answerTextField.placeholder = "Answer"
    }
    
    // brings to new question after answering correctly!!
    func continueNext() {
        // Update the questionLabel to another problem
        callingEquations()
        answerTextField.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        answerTextField.layer.borderWidth = 1
        answerTextField.text = ""
        answerTextField.placeholder = "Answer"
    }
    
}
