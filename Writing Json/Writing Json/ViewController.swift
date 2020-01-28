//
//  ViewController.swift
//  Writing Json
//
//  Created by Reed Wilson on 1/9/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brandProduct: UILabel!
    @IBOutlet weak var descriptionProduct: UILabel!
    @IBOutlet var materials: UIView!
    @IBOutlet weak var materialsLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var materialsInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = getFileURL() {
            let data = try? Data (contentsOf: url)
            if let data = data {
                let dict = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                nameInput.text = dict?["name"]
                descriptionInput.text = dict?["description"]
                materialsInput.text = dict?["materials"]
            }
        }
    }
    
    func getFileURL() -> URL? {
        let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        if docDirectory != nil {
            return docDirectory!.appendingPathComponent("savefile.json")
        }
        return nil
    }

    @IBAction func saveButton(_ sender: Any) {
        let data: [String:String] = [
            "name": nameInput.text ?? "N/A",
            "description": descriptionInput.text ?? "N/A",
            "materials": materialsInput.text ?? "N/A"
        ]
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url!)
        } else {
            print("Failed to save")
        }
    }
    @IBAction func loadButton(_ sender: Any) {
        
    }
    
}

