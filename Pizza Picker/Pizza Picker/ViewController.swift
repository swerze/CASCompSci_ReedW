//
//  ViewController.swift
//  Pizza Picker
//
//  Created by Reed Wilson on 10/16/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flavio.count
    }
    

    @IBOutlet weak var pizzaButton: UIButton!
    @IBOutlet weak var pizzaShow: UILabel!
    @IBOutlet weak var pizzaList: UIPickerView!
    
    let flavio = ["Dolphin", "Sharkfin", "Elephant", "Girrafe", "Rhino", "Elmo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flavio[row]
    }
    
    @IBAction func pizzaClick(_ sender: Any) {
        let row = pizzaList.selectedRow(inComponent: 0)
        pizzaShow.text = "You are ordering a "+flavio[row] + " pizza"
    }

}

