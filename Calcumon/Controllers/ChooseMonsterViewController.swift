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
    var selectedIndexPath: IndexPath?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.layer.cornerRadius = closeBtn.bounds.size.width / 2
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // animate to let user know they have chosen that character
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.superview?.bringSubviewToFront(cell!)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            cell?.frame = collectionView.bounds
        }, completion: nil)
        
        self.selectedIndexPath = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.superview?.bringSubviewToFront(cell!)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            cell?.frame = collectionView.bounds
        }, completion: nil)
        
        self.selectedIndexPath = nil
    }
    
}
