//
//  LoginViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/19/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var activityView: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        keyboardListenEvents()
    }
    
    func keyboardListenEvents() {
        usernameTextField.delegate = self
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
        self.fadingViewAnimation()
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    @IBAction func swipeToHideKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        // creating the activity indicator
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
        checkTextfields()
    }
    
    func checkTextfields() {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = sb.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            vc.textBody.text = "Make sure to insert all text fields!!"
            self.addChild(vc)
            self.view.addSubview(vc.view)
        } else {
            
            Service.loginOldUser(router: .existingLogin, password: passwordTextField.text!, username: usernameTextField.text!) { result in
                if result == "Wrong Username or Password" {
                    self.activityView.stopAnimating()
                    let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let vc = sb.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
                    vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                    vc.ohnoLabel.text = "Error!"
                    vc.textBody.text = "Wrong username or password"
                    self.addChild(vc)
                    self.view.addSubview(vc.view)
                    return
                    
                } else if result == "success" {     // Correctly in the database
                    self.activityView.stopAnimating()
                    let story = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
                    guard let dashboardVC = story.instantiateViewController(withIdentifier: "userDashboardViewController") as? UserDashboardViewController else { return }
                    dashboardVC.welcomeText = self.usernameTextField.text!
                    dashboardVC.modalPresentationStyle = .overCurrentContext
                    self.fadingViewAnimation()
                    self.navigationController?.pushViewController(dashboardVC, animated: false)
                    print("successfully logged in")
                }
                
            }
            
        }
    }
}
