//
//  ViewController.swift
//  collectionView
//
//  Created by FareedQ on 2017-01-26.
//  Copyright © 2017 FareedQ. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var BounceArea: UIView!
    @IBOutlet weak var verticalSpacingBounceArea: NSLayoutConstraint!
    @IBOutlet weak var heightBounceArea: NSLayoutConstraint!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 1, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2 - 1, height: screenWidth * 11/24)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        collectionView!.collectionViewLayout = layout
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        //cell.myLabel.text = self.items[indexPath.item]
        // cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset;
    }
    
    var lastContentOffset = CGPoint()
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        heightBounceArea.constant = -self.collectionView.contentOffset.y
        verticalSpacingBounceArea.constant = self.collectionView.contentOffset.y - 19
        if(self.collectionView.contentOffset.y < -20){
            BounceArea.alpha = -self.collectionView.contentOffset.y / 200
            print(self.collectionView.contentOffset.y)
        } else {
            BounceArea.alpha = 0
        }
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}

