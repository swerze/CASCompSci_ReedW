//
//  ViewController.swift
//  Rigid Programming
//
//  Created by Reed Wilson on 2/3/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        let button = sender as! UIButton
        if button.titleLabel!.text! == "Chain" {
        dvc.itemChosen = [
            "name": "Chain",
            "description": "Pulled through the rusty box and caught by it's lock"
            ]
        } else if button.titleLabel!.text! == "Lock" {
            dvc.itemChosen = [
                "name": "Lock",
                "description": "Protected and protects, is not stronger than the box"
            ]
        } else {
            dvc.itemChosen = [
                "name": "Pole",
                "description": "A reminder of what I've done, and what I need to set right"
            ]
        }
    }

}

