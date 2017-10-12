//
//  ViewController.swift
//  ios-10-10-17
//
//  Created by JEFFERSON RYLEE ESPIRITU on 10/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblRes: UILabel!
    @IBAction func btnDot(_ sender: Any) {
        self.onBtnClick(".")
    }
    @IBAction func btnZero(_ sender: Any) {
        self.onBtnClick("0")
    }
    @IBAction func btnOne(_ sender: Any) {
        self.onBtnClick("1")
    }
    @IBAction func btnTwo(_ sender: Any) {
        self.onBtnClick("2")
    }
    @IBAction func btnThree(_ sender: Any) {
        self.onBtnClick("3")
    }
    @IBAction func btnFour(_ sender: Any) {
        self.onBtnClick("4")
    }
    @IBAction func btnFive(_ sender: Any) {
        self.onBtnClick("5")
    }
    @IBAction func btnSix(_ sender: Any) {
        self.onBtnClick("6")
    }
    @IBAction func btnSeven(_ sender: Any) {
        self.onBtnClick("7")
    }
    @IBAction func btnEight(_ sender: Any) {
        self.onBtnClick("8")
    }
    @IBAction func btnNine(_ sender: Any) {
        self.onBtnClick("9")
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        self.onOpClick("+")
    }
    @IBAction func btnSubtract(_ sender: Any) {
        self.onOpClick("-")
    }
    @IBAction func btnMultiply(_ sender: Any) {
        self.onOpClick("×")
    }
    @IBAction func btnDivide(_ sender: Any) {
        self.onOpClick("÷")
    }
    @IBAction func btnPercent(_ sender: Any) {
        self.onOpClick("%")
    }
    @IBAction func btnPlusMinus(_ sender: Any) {
        self.onOpClick("/")
    }
    @IBAction func btnDel(_ sender: Any) {
        self.toggle = false
        
        var s = lblRes.text!
        if !s.isEmpty {
            s.remove(at: s.index(before: s.endIndex))
        }
            
        if s.isEmpty {
            s = "0"
        }
        
        lblRes.text = s
    }
    @IBAction func btnAC(_ sender: Any) {
        self.clear()
    }
    
    @IBAction func btnEquals(_ sender: Any) {
        self.evaluate()
        // self.clear()
    }
    
    private var n1: Float?
    private var n2: Float?
    private var op: Character?
    private var toggle: Bool = false
    
    private func onBtnClick(_ btn: Character) {
        // check if n1 is nil
        // if not nil, erase text
        if self.toggle {
            lblRes.text = "0"
            self.toggle = false
        }
        
        var x = lblRes.text ?? ""
        if x == "0" && btn != "." {
            x = ""
        }
        if let _ = Float(x + String(btn)) {
            lblRes.text = x + String(btn)
        }
        
    }
    
    private func onOpClick(_ btn: Character) {
        // save number to n1 if no operations
        if self.op == nil, let x = lblRes.text {
            self.op = btn
            self.n1 = Float(x) ?? 0.0
            // lblRes.text = String(self.n1!)
            self.toggle = true
        }
        
        if (btn == "%") {
            self.toggle = false
            self.evaluate()
        }
        
        if (btn == "/") {
            self.toggle = false
            self.evaluate()
        }
        
    }
    
    private func evaluate() {
        if self.op == "%" {
            if let m = self.n1 {
                self.n1 = m / 100.0
                lblRes.text = String(self.n1!)
                self.op = nil
            }
            return
        }
        
        if self.op == "/" {
            if let m = self.n1 {
                self.n1 = m * -1
                lblRes.text = String(self.n1!)
                self.op = nil
            }
            return
        }
        
        // n1 and op shoud not be nil
        // n2 should be nil
        if self.n2 == nil && !(self.n1 == nil && self.op == nil) {
            var res: Float?
            
            if let x = lblRes.text {
                self.n2 = Float(x) ?? 0.0
            }
            
            switch self.op {
            case Character("+")?:
                res = self.n1! + self.n2!
            case Character("-")?:
                res = self.n1! - self.n2!
            case Character("×")?:
                res = self.n1! * self.n2!
            case Character("÷")?:
                res = self.n2! == 0 ? 0.0 : self.n1! / self.n2!
            default:
                break
            }
            
            if let t = res {
                lblRes.text = String(describing: t)
                self.clear(false)
            }
            
        }
        
    }
    
    private func clear(_ withRes: Bool = true) {
        self.n1 = nil
        self.n2 = nil
        self.op = nil
        
        if withRes {
            lblRes.text = "0"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

