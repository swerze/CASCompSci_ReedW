//
//  ViewController.swift
//  Schedule
//
//  Created by Brandon Adiele on 10/23/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return dayType.count
        }
        else if component == 1{
            return weekday.count
        }
        else {
            return schedule.count
        }
    }
    
    
    var theDay = "A"
    var theWeekday = "Monday"
    var theSchedule = "Normal"
    
    let dayType = ["A", "C", "B"]
    let weekday = ["Mon", "Tues", "Wedn", "Thurs", "Fri"]
    let schedule = ["Normal", "Double", "Assembly"]
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return dayType[row]
        }
        else if component == 1{
            return weekday[row]
        }
        else {
            return schedule[row]
        }
    }
    
    var curWeekday:String = " "
    var curDayType:String = " "
    
    let mySchedule:[String:String] = [
        "A": "Ethics",
        "B": "CAS CompSci",
        "C": "French 4",
        "D": "English 4",
        "E": "Calc",
        "F": "Music Theory",
        "Mon/Thurs": "Double Free",
        "Tues/Fri": "Modern Music",
        "Wed": "Life Skills"
    ]
    
    
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = pickerView.selectedRow(inComponent: 0)
        let ACBDay = dayType[dayTypeRow]
        let weekDayRow = pickerView.selectedRow(inComponent: 1)
        let weekType = weekday[weekDayRow]
        
        let periodRotation:[String:[String:[String]]] = [
            "A":[
                "Monday": ["A", "B", "D", "E", "Mon/Thurs"],
                "Tuesday": ["A", "B", "D", "E", "Tues/Fri"],
                "Wednesday": ["A", "B", "D", "E", "Wed"],
                "Thursday": ["A", "B", "D", "E", "Mon/Thurs"],
                "Friday": ["A", "B", "D", "E", "Tues/Fri"],
            ],
            "C":[
                "Monday": ["C", "A", "F", "D", "Mon/Thurs"],
                "Tuesday": ["C", "A", "F", "D", "Tues/Fri"],
                "Wednesday": ["C", "A", "F", "D", "Wed"],
                "Thursday": ["C", "A", "F", "D", "Mon/Thurs"],
                "Friday": ["C", "A", "F", "D", "Tues/Fri"],
            ],
            "B":[
                "Monday": ["B", "C", "E", "F", "Mon/Thurs"],
                "Tuesday": ["B", "C", "E", "F", "Tues/Fri"],
                "Wednesday": ["B", "C", "E", "F", "Wed"],
                "Thursday": ["B", "C", "E", "F", "Mon/Thurs"],
                "Friday": ["B", "C", "E", "F", "Tues/Fri"],
            ]
        ]
    
        let mySched = getScheduleForDay(periods: periodRotation[ACBDay]![weekType]!, mySchedule: mySchedule)
        label.text = mySched
    }
    
    
    
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String {
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "Free"
            output += "\n"
        }
        return output
        
    }
}

