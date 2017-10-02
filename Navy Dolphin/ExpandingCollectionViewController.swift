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
    
    @IBOutlet weak var currentItemLabel: UILabel!
    @IBOutlet weak var confettiView: SAConfettiView!
    
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
        UserDefaults.standard.synchronize()
        var checkboxTrackerArray: [Bool] = UserDefaults.standard.array(forKey: "checkboxTrackerArray") as! [Bool]
        let expandingCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        expandingCell.layer.shouldRasterize = true;
        expandingCell.layer.rasterizationScale = UIScreen.main.scale;
        expandingCell.completionCheckBox?.setOn(checkboxTrackerArray[indexPath.row], animated: false)
        expandingCell.cellIsOpen(false, animated: false)
        /* Fix this: Loading large images is causing the lag when scrolling in UICollectionView. The first-time resizing of large images to fit the view
         is what is causing the slowdowns.  */
        expandingCell.backgroundImageView?.image = UIImage(named: TaskConstants.tasks[indexPath.row][0])
        expandingCell.taskLabel?.text = "Task \(indexPath.row + 1)"
        expandingCell.integerLabel = indexPath.row
        expandingCell.completionCheckBox?.on = checkboxTrackerArray[indexPath.row]
        self.currentItemLabel.text = "\(indexPath.row + 1) / \(TaskConstants.tasks.count)"
        return expandingCell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell, currentIndex == indexPath.row else { return }
        if cell.isOpened == false {
            cell.cellIsOpen(true, animated: true)
        } else {
            cell.cellIsOpen(false, animated: true)
        }
    }
}

// Confetti View Methods
extension ExpandingCollectionViewController {
    
    func startConfettiFall() {
        confettiView.intensity = 1
        confettiView.type = .Triangle
        confettiView.startConfetti()
    }
}


