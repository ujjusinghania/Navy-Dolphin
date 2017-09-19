//
//  SecondViewController.swift
//  Navy Dolphin
//
//  Created by Ujjwal Singhania on 9/15/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "Background Image"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5; 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardStyleCell")
        return cell!
    }
    
}

