//
//  ViewController.swift
//  Picker View Third Time
//
//  Created by Reed Wilson on 10/23/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return abc.count
        }
        if component == 1 {
            return days.count
        } else {
            return type.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return abc[row]
        }
        if component == 1 {
            return days[row]
        } else {
            return type[row]
        }
    }
    
    @IBOutlet weak var pick: UIPickerView!
    @IBOutlet weak var click: UIButton!
    
    let abc = ["A", "B", "C"]
    let days = ["Mon", "Tues", "Wed", "Thurs", "Fri"]
    let type = ["reg", "2XBlock", "Assembly"]
    
    @IBAction func genSched(_ sender: Any) {
        let dayABC = pick.selectedRow(inComponent: 0)
        
        let matrixA = ["A period", "B period", "C period", "D period", "E period", "F period"]
        let matrixB = ["Arts Block", "Double Free", "Life Skills Block"]
        
        let mySched = getSchedForDay(periods: parsePeriods(matrix: matrixA, dayType: pick.selectedRow(inComponent: 2), abc: dayABC))
    }
    
    func getSchedForDay(periods: [String]){
        
    }
    
    func parsePeriods(matrix: [String], dayType: Int, abc: Int) -> [String] {
        var output1 = matrix
        if abc == 0 {
        output1 = [output1.remove(at: abc + 3)]
        output1 = [output1.remove(at: abc + 5)]
        } else {
            output1 = [output1.remove(at: abc)]
            output1 = [output1.remove(at: abc + 3)]
            }
        return
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

