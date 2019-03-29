//
//  ChooseMonsterViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/25/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ChooseMonsterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var closeBtn: UIButton!
    let monsterImages = [#imageLiteral(resourceName: "Goob"), #imageLiteral(resourceName: "Zoob")]
    let monsterName = ["Goob", "Zoob"]
    
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
        let width = (view.frame.size.width) / 2
        let height = (view.frame.size.width - 20) / 2
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allMonstersCell", for: indexPath) as! AllMonstersCell
        cell.monsterImageView.image = monsterImages[indexPath.row]
        cell.monsterName.text = monsterName[indexPath.row]
        return cell
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.fadingViewAnimation()
        checkIfInNavController()
        // TODO: currently cannot use circular animation on this button yet because is in NAVIGATION STACK!!
    }
}

extension ChooseMonsterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 50, bottom: 0, right: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
