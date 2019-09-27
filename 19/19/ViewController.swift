//
//  ViewController.swift
//  19
//
//  Created by Reed Wilson on 9/19/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var counterButton: UIButton!

    var countTime = 0
    
    @IBAction func clicked(_ sender: UIButton) {
        countTime += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = "look at this blank screen with a \(countTime) on it"
        counterButton.titleLabel?.text = "\(countTime)"
        // Do any additional setup after loading the view.
    }


}

