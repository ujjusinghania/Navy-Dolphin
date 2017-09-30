//
//  CollectionViewCell.swift
//  Navy Dolphin
//
//  Created by Ujjwal Singhania on 9/15/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit
import expanding_collection
import BEMCheckBox

class CollectionViewCell: BasePageCollectionCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var completionCheckBox: BEMCheckBox!
    
    var integerLabel: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func checkBoxActivated(_ sender: Any) {
        UserDefaults.standard.synchronize()
        var checkboxTrackerArray: [Bool] = UserDefaults.standard.array(forKey: "checkboxTrackerArray") as! [Bool]
        checkboxTrackerArray[integerLabel!] = (sender as! BEMCheckBox).on
//        completionCheckBox.minimumTouchSize = CGSize(width: 0, height: 0)
        UserDefaults.standard.removeObject(forKey: "checkboxTrackerArray")
        UserDefaults.standard.set(checkboxTrackerArray, forKey: "checkboxTrackerArray")
    }
}
