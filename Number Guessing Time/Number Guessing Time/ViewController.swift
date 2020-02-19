//
//  ViewController.swift
//  Number Guessing Time
//
//  Created by Reed Wilson on 2/19/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ease: UIButton!
    @IBOutlet weak var med: UIButton!
    @IBOutlet weak var hard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let swerze = segue.destination as! StackViewController
        let UIButton = sender as! UIButton
        if UIButton.titleLabel!.text! == "Ease" {
            swerze.mode = 1
        } else if UIButton.titleLabel!.text! == "Intermediary" {
            swerze.mode = 2
        } else {
            swerze.mode = 3
        }
    }

}

