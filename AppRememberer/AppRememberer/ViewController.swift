//
//  ViewController.swift
//  AppRememberer
//
//  Created by Reed Wilson on 1/7/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greetLabel: UILabel!
    @IBOutlet weak var nameEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName: String? = try? String(contentsOf: getFile())
        greetLabel.text = "Hello, \(existingName ?? "Stranger" )"
    }

    func getFile() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("UserName.txt")
    }
    
    @IBAction func rememberName(_ sender: Any) {
        let name = nameEntry.text!
        try! name.write(to: getFile(), atomically: true, encoding: .utf8)
        greetLabel.text = "Hello, \(name)"
    }
    
    @IBAction func forgetName(_ sender: Any) {
        try? FileManager.default.removeItem(at: getFile())
        greetLabel.text = "Hello"
    }
    
}

