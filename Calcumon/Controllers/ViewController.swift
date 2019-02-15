//
//  ViewController.swift
//  Calcumon
//
//  Created by Sarin Swift on 2/6/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
//    let colors = [#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    let images = [#imageLiteral(resourceName: "Inspiration-15"), #imageLiteral(resourceName: "Inspiration-11"), #imageLiteral(resourceName: "Inspiration-12"), #imageLiteral(resourceName: "Inspiration-04"), #imageLiteral(resourceName: "Inspiration-06"), #imageLiteral(resourceName: "Inspiration-10"), #imageLiteral(resourceName: "Inspiration-03"), #imageLiteral(resourceName: "Inspiration-09"), #imageLiteral(resourceName: "Inspiration-05"), #imageLiteral(resourceName: "Inspiration-07"), #imageLiteral(resourceName: "Inspiration-02"), #imageLiteral(resourceName: "Inspiration-08"), #imageLiteral(resourceName: "Inspiration-13")]
    let categories = ["• Algebra", "Radicals", "Complex Numbers", "Polynomials", "Quadratic Polynomials", "Equation Solving", "Systems of Equations", "• Calculus", "Integrals", "Discontinuities", "Derivatives", "• Linear Algebra", "Vectors", "Matrices", "• Statistics", "Lists"]
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.decelerationRate = .fast
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
//        cell.contentView.backgroundColor = colors[indexPath.row]
        cell.imageView.image = images[indexPath.row]
        cell.titleLabel.text = categories[indexPath.row]
        return cell
    }
    
    // tap to select a cell
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let layout = collectionViewLayout as? UltravisualLayout else {
            return
        }
        
        let offSet = layout.dragOffset * CGFloat(indexPath.item)
        if collectionView.contentOffset.y != offSet {
            collectionView.setContentOffset(CGPoint(x: 0, y: offSet), animated: true)
        }
        
        // Presenting a navController to the singleCategoryVC
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let singleCategoryVC = story.instantiateViewController(withIdentifier: "singleCategoryView") as? SingleCategoryViewController else { return }
        let navController = UINavigationController(rootViewController: singleCategoryVC)
        navController.navigationItem.leftBarButtonItem?.title = "Back"
        self.present(navController, animated: true, completion: nil)
    }
    
}
