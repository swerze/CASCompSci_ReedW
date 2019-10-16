//
//  ViewController.swift
//  oh boyo
//
//  Created by Reed Wilson on 9/23/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var bornButton: UISwitch!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var showAge: UILabel!

    var birthYear = 2019
    var year = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func typinated(_ sender: UITextField) {
        if let year = Float(ageField.text!)  {
            print(year)
        } else {
        showAge.text = "gimme a better value"
    }
        
    }
    @IBAction func switchie(_ sender: Any) {
        if bornButton.isOn {
            birthYear -= 1
        } else {
            birthYear = 2019
        }
    }
    @IBAction func calculating(_ sender: UIButton) {
        birthYear -= year
        print(birthYear)
        showAge.text = "\(birthYear)"
    }
    
}

