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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // check what component
        // set row in n
        
        if (component == 0) {
            n1 = row
        }
        else if component == 1 {
            op = row
        }
        else if component == 2 {
            n2 = row
        }
        
        if let res = self.solve(Float(n1), Float(n2)) {
            lblRes.text = String(res)
        }
        else {
            lblRes.text = ""
        }
    }

    
    private func solve(_ n: Float?, _ m: Float?) -> Float? {
        if n == nil || m == nil {
            return nil
        }
        let n1 = n!, n2 = m!
        // solve
        switch op {
        case 0: return n1 + n2
        case 1: return n1 - n2
        case 2: return n1 * n2
        case 3:
            return n2 == 0 ? nil : n1 / n2
        default:
            return nil
        }
    }
    
    private let operators = ["+", "-", "*", "÷"]
    private var n1: Int = 0
    private var n2: Int = 0
    private var op: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

