//
//  CollectionViewCell.swift
//  Navy Dolphin
//
//  Created by Ujjwal Singhania on 9/15/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit
import expanding_collection
import AIFlatSwitch

class CollectionViewCell: BasePageCollectionCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
