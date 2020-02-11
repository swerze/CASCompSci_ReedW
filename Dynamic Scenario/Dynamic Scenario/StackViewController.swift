//
//  StackViewController.swift
//  Dynamic Scenario
//
//  Created by Reed Wilson on 2/11/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    var buttonCount = 5
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttons = (1...buttonCount).map({ (x) -> UIButton in
            let newButton = UIButton()
            newButton.titleLabel!.text = "Button \(x)"
            newButton.titleLabel?.textColor = UIColor.black
            return newButton
        })
        for button in buttons {
            stackView.addArrangedSubview(button)
            let constraint = NSLayoutConstraint(item: button,
                                                attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 0)
            if button != buttons[0] {
                stackView.addConstraint(constraint)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "What up homie?", message: "Swerzey dawgs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sweeeze", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
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
