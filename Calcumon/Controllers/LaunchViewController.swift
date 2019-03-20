//
//  LaunchViewController.swift
//  Calcumon
//
//  Created by Lucia Reynoso on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let categoryVC = story.instantiateViewController(withIdentifier: "categories") as? ViewController else { return }
        self.present(categoryVC, animated: true, completion: nil)
    }
}
