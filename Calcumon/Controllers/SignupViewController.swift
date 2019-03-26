//
//  SignupViewController.swift
//  Calcumon
//
//  Created by Lucia Reynoso on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    var activityView: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    
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
        self.fadingViewAnimation()
        checkIfInNavController()
    }
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        resignResponder()
    }
    @IBAction func swipeToHideKeyboard(_ sender: UISwipeGestureRecognizer) {
        resignResponder()
    }
    func resignResponder() {
        self.emailTextField.resignFirstResponder()
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.repeatPassTextField.resignFirstResponder()
    }
    
    @IBAction func signupBtnTapped(_ sender: UIButton) {
        // creating the activity indicator
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
        checkTextfields()
    }
    
    func checkTextfields() {
        if emailTextField.text == "" || usernameTextField.text == "" || passwordTextField.text == "" || repeatPassTextField.text == "" {
            self.activityView.stopAnimating()
            let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = sb.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            vc.textBody.text = "Make sure to insert all text fields!!"
            self.addChild(vc)
            self.view.addSubview(vc.view)
        } else {
            
            Service.signupNewUser(router: .newLogin, email: emailTextField.text!, password: passwordTextField.text!, username: usernameTextField.text!)
            
            let story = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
            guard let dashboardVC = story.instantiateViewController(withIdentifier: "userDashboardViewController") as? UserDashboardViewController else { return }
            dashboardVC.welcomeText = usernameTextField.text!
            dashboardVC.modalPresentationStyle = .overCurrentContext
            print("successfully signed up as a new user")
            // Previous vc is coming from login.storyboard, so we use pushViewController()
            // else, use present()
            activityView.stopAnimating()
            if let viewControllers = self.navigationController?.viewControllers {
                for vc in viewControllers {
                    if vc.isKind(of: LaunchViewController.classForCoder()) {
                        self.fadingViewAnimation()
                        self.navigationController?.pushViewController(dashboardVC, animated: false)
                        return
                    }
                }
            }
            self.fadingViewAnimation()
            self.present(dashboardVC, animated: false, completion: nil)
        }
    }
}
