//
//  ViewController.swift
//  temp
//
//  Created by Jefferson Rylee on 21/08/2017.
//  Copyright © 2017 Jefferson Rylee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textColor = [Float]()
    var bgColor = [Float]()
    
    @IBOutlet weak var rSliderOutlet: UISlider!
    @IBOutlet weak var gSliderOutlet: UISlider!
    @IBOutlet weak var bSliderOutlet: UISlider!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    @IBAction func btnShowMsg(_ sender: Any) {
        lblMsg.text = field.text
    }
    @IBAction func btnReset(_ sender: Any) {
        reset()
    }
    @IBAction func switchAction(_ sender: Any) {
        if switchOutlet.isOn {
            // background
            setBgColor()
        }
        else {
            setTextColor()
        }
        
    }
    @IBAction func rSliderAction(_ sender: Any) {
        slide()
    }
    @IBAction func gSliderAction(_ sender: Any) {
        slide()
    }
    @IBAction func bSliderAction(_ sender: Any) {
        slide()
    }
    
    // functions
    func slide() -> Void {
        if switchOutlet.isOn {
            // save background
            bgColor[0] = rSliderOutlet.value
            bgColor[1] = gSliderOutlet.value
            bgColor[2] = bSliderOutlet.value
        
            setBgColor()
        }
        else {
            textColor[0] = rSliderOutlet.value
            textColor[1] = gSliderOutlet.value
            textColor[2] = bSliderOutlet.value
        
            setTextColor()
        }
    }
    func reset() -> Void {
        field.text = ""
        lblMsg.text = "Hello World!"
        switchOutlet.isOn = true
        
        for i in 0..<3 {
            textColor[i] = 255
            bgColor[i] = 0
        }
        
        setTextColor()
        setBgColor()
    }
    func setTextColor() -> Void {
        lblMsg.textColor = UIColor.init(red: CGFloat(textColor[0]), green: CGFloat(textColor[1]), blue: CGFloat(textColor[2]), alpha: 1.0)
        
        rSliderOutlet.setValue(textColor[0], animated: true)
        gSliderOutlet.setValue(textColor[1], animated: true)
        bSliderOutlet.setValue(textColor[2], animated: true)
    }
    func setBgColor() -> Void {
        self.view.backgroundColor = UIColor.init(red: CGFloat(bgColor[0]), green: CGFloat(bgColor[1]), blue: CGFloat(bgColor[2]), alpha: 1.0)
        
        rSliderOutlet.setValue(bgColor[0], animated: true)
        gSliderOutlet.setValue(bgColor[1], animated: true)
        bSliderOutlet.setValue(bgColor[2], animated: true)
    }
    
    // override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textColor.append(0.0)
        textColor.append(0.0)
        textColor.append(0.0)
        
        bgColor.append(0.0)
        bgColor.append(0.0)
        bgColor.append(0.0)
        
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

