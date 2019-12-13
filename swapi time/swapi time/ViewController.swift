//
//  ViewController.swift
//  swapi time
//
//  Created by Reed Wilson on 12/11/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func pressThree(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/starships/9/")!
        let responseData: Data = try! Data(contentsOf: url)
        let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
        if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                    labelThree.text = name
                }
            }
        }
    }
    
    @IBAction func pressTwo(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/5/")!
        let responseData: Data = try! Data(contentsOf: url)
        let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
        if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                    labelTwo.text = name
                }
            }
        }
    }
    
    @IBAction func pressOne(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/people/1/")!
        let responseData: Data = try! Data(contentsOf: url)
        let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
        if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                    nameLabel.text = name
                }
            }
        }
    }
    

}

