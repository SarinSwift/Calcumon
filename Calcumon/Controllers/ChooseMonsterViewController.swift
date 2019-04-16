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
    @IBOutlet weak var pickCharBtn: UIButton!
    
    let monsterImages = [#imageLiteral(resourceName: "Goob"), #imageLiteral(resourceName: "Zoob")]
    let monsterName = ["Goob", "Zoob"]
    
    var selectedIndexPath = [IndexPath]()
    var originalCellPoints = [IndexPath: CGRect]()      // will contain: [[0, 1]: (107.0, 330.0, 200.0, 300.0),
                                                        //                [0, 0]: (107.0, 30.0, 200.0, 300.0)]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.layer.cornerRadius = closeBtn.bounds.size.width / 2
        pickCharBtn.isHidden = true
        pickCharBtn.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.231372549, blue: 0.7176470588, alpha: 1)
        
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allMonstersCell", for: indexPath) as! AllMonstersCell
        cell.monsterImageView.image = monsterImages[indexPath.row]
        cell.monsterName.text = monsterName[indexPath.row]
        
        if selectedIndexPath.contains(indexPath) {
            print("contains index path")
        } else {
            print("does not contain index path yet")
        }
        
        return cell
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.fadingViewAnimation()
        checkIfInNavController()
        // TODO: currently cannot use circular animation on this button yet because is in NAVIGATION STACK!!
    }
    
    @IBAction func pickCharBtnTapped(_ sender: UIButton) {
        // simply dismisses it
        checkIfInNavController()
    }
}

extension ChooseMonsterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: 300)
        return CGSize(width: view.bounds.width / 1.5, height: view.bounds.height / 3.1)
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
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 0.2, options: [], animations: {
            // add cell's frame to originalCellPoints dictionary - access later when we want to deselect item
            if !self.selectedIndexPath.contains(indexPath) {
                self.originalCellPoints[indexPath] = cell?.frame
            }
            cell?.frame = collectionView.bounds
            
        }, completion: nil)
        
        self.pickCharBtn.isHidden = false
        self.selectedIndexPath.append(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.superview?.bringSubviewToFront(cell!)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 0.2, options: [], animations: {
            // grab the correct dictionary key that maps to a cell frame
            cell?.frame = self.originalCellPoints[indexPath]!
            
        }, completion: nil)
        
        if selectedIndexPath.contains(indexPath) {
            selectedIndexPath.remove(at: selectedIndexPath.index(of: indexPath)!)
        }
        
        self.pickCharBtn.isHidden = true
    }
    
}
