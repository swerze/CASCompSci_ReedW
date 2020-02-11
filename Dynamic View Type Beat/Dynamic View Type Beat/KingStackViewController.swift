//
//  KingStackViewController.swift
//  Dynamic View Type Beat
//
//  Created by Reed Wilson on 2/6/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class KingStackViewController: UIViewController {

    var labelCount = 5
    @IBOutlet weak var kingStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({ (x) -> UILabel in
            let newLabel = UILabel()
            newLabel.text = "Hello Dude \(x)"
            return newLabel
        })
        for label in labels {
            kingStackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label,
                                                attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 0)
            if label != labels[0] {
                kingStackView.addConstraint(constraint)
            }
        }
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
