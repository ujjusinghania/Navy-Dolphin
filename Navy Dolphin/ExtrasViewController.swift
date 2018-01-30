//
//  ExtrasViewController.swift
//  Navy Dolphin
//
//  Created by Ujjwal Singhania on 1/29/18.
//  Copyright © 2018 Ujjwal Singhania. All rights reserved.
//

import UIKit

class ExtrasViewController: UIViewController {

    @IBOutlet weak var youtubeEmbedView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadURL("Kb24RrHIbFk")
    }
    
    func loadURL(_ videoURL: String) {
        youtubeEmbedView.loadRequest(URLRequest(url: URL(string: "https://www.youtube.com/embed/\(videoURL)")!))
    }

}
