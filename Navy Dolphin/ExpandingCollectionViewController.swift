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

class ExpandingCollectionViewController: ExpandingViewController {
    
    override func viewDidLoad() {
        itemSize = CGSize(width: 277, height: 414)
        super.viewDidLoad()
        // register cell
        let nib = UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
    }
}

extension ExpandingCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TaskConstants.tasks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        guard let cell = cell as? CollectionViewCell else { return }
        
        cell.backgroundImageView?.image = UIImage(named: TaskConstants.tasks[indexPath.row])
        cell.isOpened = false
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
