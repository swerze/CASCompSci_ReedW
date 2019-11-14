//
//  DetailViewController.swift
//  boats
//
//  Created by Reed Wilson on 11/14/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var boat:Boat?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = boat?.name
        infoLabel.text = "A \(boat!.size), \(boat!.color) colored \(boat!.name) with \(boat!.dolphinPower) dolphin power."

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
