//
//  ViewController.swift
//  calcinater
//
//  Created by Reed Wilson on 10/7/19.
//  Copyright © 2019 Reed Wilson. All rights reserved.
//

import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
    case multiplication
}

class ViewController: UIViewController {
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    @IBOutlet weak var label: UILabel!
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressEquals(_ sender: UIButton) {
        guard let labelInt:Int = Int(labelString)else {
            return
        }
        
        if(currentMode == .not_set || lastButtonWasMode){
            return
        }
        
        if(currentMode == .addition){
            savedNum += labelInt
        }
        
        if(currentMode == .subtraction){
            savedNum -= labelInt
        }
        
        if(currentMode == .multiplication){
            savedNum *= labelInt
        }
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    @IBAction func didPressPlus(_ sender: UIButton) {
        changeMode(newMode: .addition)
        labelString = ""
    }
    
    @IBAction func didPressMinus(_ sender: UIButton) {
        changeMode(newMode: .subtraction)
        labelString = ""
    }
    
    @IBAction func didPressTimes(_ sender: UIButton) {
        changeMode(newMode: .multiplication)
        labelString = ""
    }
    
    @IBAction func didPressClear(_ sender: UIButton) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        label.text = "0"
        lastButtonWasMode = false
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        guard let stringValue: String = sender.titleLabel?.text else {
            label.text = "Error"
            return
        }
        
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.appending(stringValue)
        updateText()
    }
    
    func updateText(){
        guard let labelInt:Int = Int(labelString)else {
            return
        }
        if(currentMode == .not_set){
            savedNum = labelInt
        }
        label.text = "\(labelInt)"
    }
    
    func changeMode(newMode:modes){
        if(savedNum == 0){
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
        
    }
    
}

//Kaelen helpinated me withe calcinatin
