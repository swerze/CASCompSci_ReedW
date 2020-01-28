//
//  ViewController.swift
//  Setlist Randomizer
//
//  Created by Reed Wilson on 1/23/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Data(contentsOf: getFileURL()).count ?? 1
    }
    

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var artistsInput: UITextField!
    @IBOutlet weak var tagsInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = getFileURL() {
            let data = try? Data (contentsOf: url)
            if let data = data {
                let dict = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                nameInput.text = dict?["name"]
                artistsInput.text = dict?["artists and instruments"]
                tagsInput.text = dict?["tags"]
            }
        }
    }
    
    func loadData() -> [String: Any]? {
        //get data from url, deseriaize, downcast, returm
        let responseData: Data = try! Data(contentsOf: savefile.json)
        let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
        if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                    nameInput.text = name
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
    
    
    func saveButton(_ sender: Any) {
        let data: [String:String] = [
            "name": nameInput.text ?? "N/A",
            "artists and instruments": artistsInput.text ?? "N/A",
            "tags": tagsInput.text ?? "N/A"
        ]
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url!)
        } else {
            print("Failed to save")
        }
    }


    
}
}
