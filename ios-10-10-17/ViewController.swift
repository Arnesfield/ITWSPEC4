//
//  ViewController.swift
//  ios-10-10-17
//
//  Created by JEFFERSON RYLEE ESPIRITU on 10/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblRes: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 1 ? self.operators.count : 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // operators
        if component == 1 {
            return self.operators[row]
        }
        // numbers
        else {
            return String(row)
        }
    }
    
    private let operators = ["+", "-", "*", "÷", "%"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

