//
//  ViewController.swift
//  MP1
//
//  Created by Jefferson Rylee on 03/10/2017.
//  Copyright © 2017 Jefferson Rylee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let OPERATIONS = ["Add","Subtract","Multiply","Divide"]
    private var MSG = ""
    
    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var opSegment: UISegmentedControl!

    @IBAction func btnSolve(_ sender: Any) {
        let n1 = self.getValue(txtNum1)
        let n2 = self.getValue(txtNum2)
        
        if let res = self.solve(n1, n2) {
            lblResult.text = "Result: \(res)"
        }
        else {
            lblResult.text = "Error! \(MSG)"
        }
    }
    
    private func getValue(_ field: UITextField) -> Float? {
        let str: String = field.text ?? "0"
        return Float(str)
    }
    
    private func solve(_ n: Float?, _ m: Float?) -> Float? {
        if n == nil || m == nil {
            MSG = "Please enter fields correctly."
            return nil
        }
        let n1 = n!, n2 = m!
        // solve
        switch opSegment.selectedSegmentIndex {
            case 0: return n1 + n2
            case 1: return n1 - n2
            case 2: return n1 * n2
            case 3:
                MSG = n2 == 0 ? "Cannot divide by 0." : MSG
                return n2 == 0 ? nil : n1 / n2
            default:
                MSG = "Please choose operation."
                return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // remove segments
        opSegment.removeAllSegments()
        for (i, value) in OPERATIONS.enumerated() {
            opSegment.insertSegment(withTitle: value, at: i, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

