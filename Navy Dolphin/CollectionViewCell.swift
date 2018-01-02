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
    
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var completionCheckBox: BEMCheckBox!
    @IBOutlet weak var lockImageView: UIImageView!
    
    var integerLabel: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func checkBoxActivated(_ sender: Any) {
        UserDefaults.standard.synchronize()
        var checkboxTrackerArray: [Bool] = UserDefaults.standard.array(forKey: "checkboxTrackerArray") as! [Bool]
        (completionCheckBox).setOn(!checkboxTrackerArray[integerLabel!], animated: true)
        checkboxTrackerArray[integerLabel!] = !checkboxTrackerArray[integerLabel!]
        UserDefaults.standard.removeObject(forKey: "checkboxTrackerArray")
        UserDefaults.standard.set(checkboxTrackerArray, forKey: "checkboxTrackerArray")
        UserDefaults.standard.set(true, forKey: "FinishedOneTask")
        ExpandingCollectionViewController.createWhisper(checkboxTrackerArray[integerLabel!], taskLabel.text!)
    }
}
