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
    var pointsResult: Int = 0
    
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var solveView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var plusPoints: UILabel!
    
    @IBOutlet weak var answerTextField: ShakingTextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var splashContinueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        keyboardListenEvents()
        
        // Setting the points score
        let pointsDefault = UserDefaults.standard
        if pointsDefault.value(forKey: "points") != nil {
            pointsResult = pointsDefault.value(forKey: "points") as! Int
            pointsLabel.text = "Points: \(pointsResult)"
        }
        
        setupNavBar()
        callingEquations()
        print("viewdidload method result is: \(result)")
        splashContinueButton.isHidden = true
        plusPoints.alpha = 0
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
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            // Not hiding the navBar??
            vc.navigationController?.navigationBar.isHidden = true
            self.addChild(vc)
            self.view.addSubview(vc.view)
            
        } else if answerInput.isContainsLetters {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            vc.textBody.text = "Answer must only contain numbers!"
            self.addChild(vc)
            self.view.addSubview(vc.view)
        }
        else {
            // Checking answer
            if answerInput == "\(self.result)" {
                // Answer was correct
                // TODO: animate the popup splashContinueButton button
                self.answerTextField.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                self.answerTextField.layer.cornerRadius = 4.5
                self.answerTextField.layer.borderWidth = 2.0
                self.splashContinueButton.isHidden = false
                self.submitButton.isHidden = true
                self.continueButton.isHidden = true
                self.pointsResult += 10
                
                // Animate the pointsLabel
                UIView.animate(withDuration: 0.3, animations: {
                    self.plusPoints.alpha = 1
                    self.plusPoints.text = "+10"
                    self.plusPoints.textColor = #colorLiteral(red: 0.2745098039, green: 0.4941176471, blue: 0.1411764706, alpha: 1)
                    self.plusPoints.transform = CGAffineTransform(scaleX: 2, y: 2)
                }) { (_) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.plusPoints.transform = CGAffineTransform.identity
                        self.plusPoints.alpha = 0
                    })
                }
                
                
                // Settign data in Userdefaults for the pointsLabel
                // accessing the core data of our application and storing info inside of there
                let pointsDefualt = UserDefaults.standard
                // can grab this data later on with the "points" key
                pointsDefualt.set(pointsResult, forKey: "points")
                pointsDefualt.synchronize()
                
            } else {
                // Answer was incorrect
                self.answerTextField.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                self.answerTextField.layer.cornerRadius = 4.5
                self.answerTextField.layer.borderWidth = 2.0
                self.answerTextField.shake()
                self.answerTextField.text = ""
                self.answerTextField.placeholder = "Answer"
                self.pointsResult -= 5
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.plusPoints.alpha = 1
                    self.plusPoints.text = "-5"
                    self.plusPoints.textColor = #colorLiteral(red: 1, green: 0.3294117647, blue: 0.2705882353, alpha: 1)
                    self.plusPoints.transform = CGAffineTransform(scaleX: 2, y: 2)
                }) { (_) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.plusPoints.transform = CGAffineTransform.identity
                        self.plusPoints.alpha = 0
                    })
                }
                
                // Settign data in Userdefaults for the pointsLabel
                let pointsDefualt = UserDefaults.standard
                pointsDefualt.set(pointsResult, forKey: "points")
                pointsDefualt.synchronize()
            }
        }
        
        print("Points: \(pointsResult)")
        pointsLabel.text = "Points: \(pointsResult)"
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            view.frame.origin.y = -keyboardRect.height
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
    @IBAction func splashButtonTapped(_ sender: UIButton) {
        callingEquations()
        answerTextField.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        answerTextField.layer.borderWidth = 1
        splashContinueButton.isHidden = true
        continueButton.isHidden = false
        submitButton.isHidden = false
        answerTextField.text = ""
        answerTextField.placeholder = "Answer"
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainPage))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pro", style: .plain, target: self, action: #selector(showMainPage))
    }
    @objc func backToMainPage() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    @objc func showMainPage() {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let profileVC = story.instantiateViewController(withIdentifier: "profileLog") as? ProfileLogViewController else { return }
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        // Update the questionLabel to another problem
        callingEquations()
        answerTextField.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        answerTextField.layer.borderWidth = 1
        answerTextField.text = ""
        answerTextField.placeholder = "Answer"
    }
    
}
