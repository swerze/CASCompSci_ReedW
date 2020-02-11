//
//  DetailsViewController.swift
//  Rigid Programming
//
//  Created by Reed Wilson on 2/3/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsView: UITextView!
    
    var itemChosen = [
        "name": "Chain",
        "description": "Pulled through the rusty box and caught by it's lock"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.text = "Break the \(itemChosen["name"] ?? nil). \n \(itemChosen["description"] ?? nil))"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
