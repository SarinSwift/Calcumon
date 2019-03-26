//
//  ChooseMonsterViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/25/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ChooseMonsterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var closeBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.layer.cornerRadius = closeBtn.bounds.size.width / 2
        flowLayout()
    }
    
    func flowLayout() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (view.frame.size.width - 40) / 2
        let height = (view.frame.size.width - 20) / 2
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allMonstersCell", for: indexPath) as! AllMonstersCell
        
        return cell
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.fadingViewAnimation()
        checkIfInNavController()
        // TODO: currently cannot use circular animation on this button yet because is in NAVIGATION STACK!!
    }
    

}
