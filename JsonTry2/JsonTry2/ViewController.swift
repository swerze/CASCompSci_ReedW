//
//  ViewController.swift
//  JsonTry2
//
//  Created by Reed Wilson on 1/27/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var infoInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = ""
        textView2.text = ""
        
    }
    
    func fileUrl() -> URL {
        let documentURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("data.json")
    }
    
    @IBAction func addCard(_ sender: Any) {
        let data: [String:String] = [
            "Name": nameInput.text ?? "",
            "Number": numberInput.text ?? "",
            "Info": infoInput.text ?? ""
        ]
        
        var unsavedCards: [[String:String]] = []
        if var savedCards:[[String : String]] = getJsonData() as [[String:String]]? {
            savedCards.append(data)
            unsavedCards = savedCards
        } else {
            unsavedCards = [data]
        }
        
        
        let anotherSorted = unsavedCards.sorted(by: {
            (a, b) in
            return a["Name"]! < b["Name"]!
        })
        
        let url = fileUrl()
        if let jsonData = try? JSONSerialization.data(withJSONObject: anotherSorted, options: []) {
            try? jsonData.write(to: url)
            print(data)
            nameInput.text = ""
            textView2.text = ""
            numberInput.text = ""
            infoInput.text = ""
        } else {
            print("Failed to save")
        }
    }
    
    func getJsonData() -> [[String:String]]? {
        let url = fileUrl()
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let dictionary: [[String:String]] = json as? [[String:String]] {
                return dictionary
            }
        }
        return nil
    }
    
    func allData() {
        textView.text = ("")
        let dictionary = getJsonData()
        if let dictionary = dictionary {
            for wordEntry in dictionary {
                let name: String = wordEntry["Name"]!
                let info: String = wordEntry["Info"]!
                let number: String = wordEntry["Number"]!
                print(name, info, number)
                textView.text = textView.text! + "\nName: \(name)\nNumber: (\(number))\n Info: \(info)\n"
            }
        }
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        textView.text = ("")
        let dictionary = getJsonData()
        if let dictionary = dictionary {
            for wordEntry in dictionary {
                let name: String = wordEntry["Name"]!
                let info: String = wordEntry["Info"]!
                let number: String = wordEntry["Number"]!
                print(name, info, number)
                textView.text = textView.text! + "\nName: \(name)\nNumber: (\(number))\n Info: \(info)\n"
            }
        }
    }
    
    
    @IBAction func clearData(_ sender: UIButton) {
        let url = fileUrl()
        try? FileManager.default.removeItem(at:url)
        textView.text = ""
        textView2.text = ""
    }
}

