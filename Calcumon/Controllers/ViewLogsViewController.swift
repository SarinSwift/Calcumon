//
//  ViewLogsViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/5/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ViewLogsViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var questionAnswersArrFromProfileVC = [QuestionAnswer]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var greatBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greatBtn.layer.cornerRadius = greatBtn.bounds.size.width / 2
        tableView.allowsSelection = false
    }
    
    @IBAction func greatBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension ViewLogsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionAnswersArrFromProfileVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "viewLogsCell", for: indexPath) as! ViewLogPressedCell
        cell.questionLabel.text = questionAnswersArrFromProfileVC[indexPath.row].question
        cell.answerLabel.text = questionAnswersArrFromProfileVC[indexPath.row].answer
        cell.answerStateIV.image = questionAnswersArrFromProfileVC[indexPath.row].correctness
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
