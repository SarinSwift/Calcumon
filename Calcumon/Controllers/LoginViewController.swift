//
//  LoginViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/19/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        keyboardListenEvents()
    }
    
    func setupView() {
        loginView.layer.cornerRadius = 10
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOpacity = 0.3
        loginView.layer.shadowOffset = CGSize.zero
        loginView.layer.shadowRadius = 10
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
            
            view.frame.origin.y = -keyboardRect.height
        } else {
            view.frame.origin.y = 0
        }
    }
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    @IBAction func swipeToHideKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    
    @IBAction func playBtnTapped(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let categoryVC = story.instantiateViewController(withIdentifier: "categories") as? ViewController else { return }
        self.present(categoryVC, animated: true, completion: nil)
    }
}
