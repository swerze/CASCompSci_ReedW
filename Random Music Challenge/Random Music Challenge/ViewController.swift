//
//  ViewController.swift
//  Random Music Challenge
//
//  Created by Reed Wilson on 12/18/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var randLabel: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var answer: String = ""
    var dataT: Data? = nil
    
    @IBAction func questionGen(_ sender: Any) {
        while dataT == nil {
            var output = ""
            for i in 1 ... 6{
                output += String(Int.random(in: 0 ..< 10))
            }
            let url: URL = URL(string: "https://api.discogs.com/releases/\(output)")!
            let release: Data = try! Data(contentsOf: url)
            dataT = release
        }
        let newRelease = dataT
        let json: Any? = try? JSONSerialization.jsonObject(with: newRelease!, options: [])
        let dictionary: [String: Any]? = json as? [String: Any]
        let name: String? = dictionary?["title"] as? String
        let date: String? = dictionary?["released"] as? String
        let answer = dictionary?["artist_sort"] as? String
       
        qLabel.text = "What artist released \(name!) in \(date!)?"
    }
    
    @IBAction func answerfinished(_ sender: Any) {
        if case let txtField.text = "\(answer)" {
            qLabel.text = "Correct!"
        } else {
            qLabel.text = "Wrong... I bet you like Kendrick"
        }
    }
    
    @IBAction func randGen(_ sender: Any) {
    }
    
}

