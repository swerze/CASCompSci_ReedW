
//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?
    

    
    // TODO: Come up with a better UI than just a single boring label.
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "swag", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
        }
        // This just puts the file contents (unparsed) into the label.
        let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
        
        let dictionary = json as! [String: Any]
        
        let idnum: String = dictionary["id number"] as! String
        let birthyear: String = dictionary["birth year"] as! String
        let groups: [String] = dictionary["groups"] as! [String]
        let tags: [String] = dictionary["tags"] as! [String]
        
        
        if let data = jsonFileData {
            // TODO: Parse the JSON data and display it in the app.
            
            myLabel.text = "Reed Wilson (\(idnum)) \nBorn \(birthyear) \nInvolved with: \(groups.joined(separator: ", ")) \nSearch tags: \(tags.joined(separator: ", "))"
        }
    }

    
}


