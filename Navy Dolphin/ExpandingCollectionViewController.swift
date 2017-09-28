//
//  ExpandingCollectionViewController.swift
//  Navy Dolphin
//
//  Created by Ujjwal Singhania on 9/15/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import Foundation
import UIKit
import expanding_collection
import SAConfettiView

class ExpandingCollectionViewController: ExpandingViewController {
    
    @IBOutlet weak var confettiView: SAConfettiView!
    var checkboxTrackerArray: [Bool]?
    
    override func viewDidLoad() {
        itemSize = CGSize(width: 240, height: 300)
        super.viewDidLoad()
        // register cell
        let nib = UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
    }
}


// Collection View Methods
extension ExpandingCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TaskConstants.tasks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        checkboxTrackerArray = UserDefaults.standard.array(forKey: "checkboxTrackerArray") as! [Bool]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.backgroundImageView?.image = UIImage(named: TaskConstants.tasks[indexPath.row][0])
        cell.cellIsOpen(false, animated: true)
        cell.taskLabel?.text = "Task \(indexPath.row + 1)"
        cell.integerLabel = indexPath.row
        cell.completionCheckBox?.on = checkboxTrackerArray![indexPath.row]
        if (checkboxTrackerArray![indexPath.row] == true) {
            cell.completionCheckBox?.minimumTouchSize = CGSize(width: 0, height: 0)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        if (confettiView.isActive()) {
            confettiView.stopConfetti()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell, currentIndex == indexPath.row else { return }
        if cell.isOpened == false {
            cell.cellIsOpen(true, animated: true)
        } else {
            cell.cellIsOpen(false, animated: true)
        }
    }}

// Confetti View Methods
extension ExpandingCollectionViewController {
    
    func startConfettiFall() {
        confettiView.intensity = 1
        confettiView.type = .Triangle
        confettiView.startConfetti()
    }
}


