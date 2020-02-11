//
//  ViewController.swift
//  dyna buttoes
//
//  Created by Reed Wilson on 2/7/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swerzeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swerzeButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    @objc func showAlert() {
        let alert = UIAlertController(title: "What up homie?", message: "Swerzey dawgs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sweeeze", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }

}

