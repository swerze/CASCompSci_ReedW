//
//  ViewController.swift
//  Buy Stuff
//
//  Created by Reed Wilson on 10/21/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return thingsToBuy.count
    }
    
    @IBOutlet weak var pick: UIPickerView!
    @IBOutlet weak var show: UILabel!
    @IBOutlet weak var click: UIButton!

    let thingsToBuy = ["Car", "Toy", "Sword", "Slave", "Computer"]
    let price = ["3,000", "40", "100,000", "14", "200"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return thingsToBuy[row]
    }
    
    @IBAction func clicked(_ sender: Any) {
        let row = pick.selectedRow(inComponent: 0)
        show.text = "u buyin a \(thingsToBuy[row]) it'll cost ye \(price[row]) d-lurz"
    }
    

}

