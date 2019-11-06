//
//  UIViewController.swift
//  xrdswords
//
//  Created by Reed Wilson on 11/5/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var vocabWord = ""
    var vocabDefinition = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = vocabDefinition
    }

  

}
