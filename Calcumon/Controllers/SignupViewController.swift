//
//  SignupViewController.swift
//  Calcumon
//
//  Created by Lucia Reynoso on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPassTextField: UITextField!
    @IBOutlet weak var signupBtn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardListenEvents()
    }
    
    func keyboardListenEvents() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            view.frame.origin.y = -(keyboardRect.height/3)
        } else {
            view.frame.origin.y = 0
        }
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        // animation for dismiss
        let animation = CATransition()
        animation.type = .fade
        animation.duration = 0.25
        self.view.window!.layer.add(animation, forKey: nil)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        self.emailTextField.resignFirstResponder()
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.repeatPassTextField.resignFirstResponder()
    }
    @IBAction func swipeToHideKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.emailTextField.resignFirstResponder()
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.repeatPassTextField.resignFirstResponder()
    }
}
