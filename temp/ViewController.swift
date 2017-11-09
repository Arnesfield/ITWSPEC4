//
//  ViewController.swift
//  temp
//
//  Created by Jefferson Rylee on 21/08/2017.
//  Copyright © 2017 Jefferson Rylee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textColor: [Float] = [1, 1, 1]
    var bgColor: [Float] = [0, 0, 0]
    
    @IBOutlet weak var rSliderOutlet: UISlider!
    @IBOutlet weak var gSliderOutlet: UISlider!
    @IBOutlet weak var bSliderOutlet: UISlider!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var lblBgStats: UILabel!
    @IBOutlet weak var lblTextStats: UILabel!
    @IBOutlet weak var lblTextSwitch: UILabel!
    @IBOutlet weak var lblBgSwitch: UILabel!
    @IBOutlet weak var lblOwner: UILabel!
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
            setStats(for: lblBgStats, colors: bgColor, name: "Background")
        }
        else {
            textColor[0] = rSliderOutlet.value
            textColor[1] = gSliderOutlet.value
            textColor[2] = bSliderOutlet.value
        
            setTextColor()
            setStats(for: lblTextStats, colors: textColor, name: "Text")
        }
        
        // saveStates()
    }
    
    func render() -> Void {
        setTextColor()
        setBgColor()
        setStats(for: lblBgStats, colors: bgColor, name: "Background")
        setStats(for: lblTextStats, colors: textColor, name: "Text")
        
        // saveStates()
    }
    
    func reset() -> Void {
        field.text = ""
        lblMsg.text = "Hello World!"
        switchOutlet.isOn = true
        
        textColor = [1, 1, 1]
        bgColor = [0, 0, 0]
        
        render()
    }
    
    
    func setTextColor() -> Void {
        let color = self.getColor(textColor)
        
        lblMsg.textColor = color
        lblBgStats.textColor = color
        lblTextStats.textColor = color
        lblBgSwitch.textColor = color
        lblTextSwitch.textColor = color
        lblOwner.textColor = color
        
        self.setSliderOutlets(textColor)
    }
    func setBgColor() -> Void {
        self.view.backgroundColor = self.getColor(bgColor)
        
        self.setSliderOutlets(bgColor)
    }
    
    func getColor(_ arr: [Float]) -> UIColor {
        return UIColor.init(red: CGFloat(arr[0]), green: CGFloat(arr[1]), blue: CGFloat(arr[2]), alpha: 1.0)
    }
    
    func setSliderOutlets(_ arr: [Float]) -> Void {
        rSliderOutlet.setValue(arr[0], animated: true)
        gSliderOutlet.setValue(arr[1], animated: true)
        bSliderOutlet.setValue(arr[2], animated: true)
    }
    
    func setStats(for label: UILabel, colors: [Float], name: String) -> Void {
        let red = Int(colors[0] * 255)
        let green = Int(colors[1] * 255)
        let blue = Int(colors[2] * 255)
        label.text = "\(name) = Red: \(red), Green: \(green), Blue: \(blue)"
    }
    
    func saveStates() -> Void {
        defaults.set(bgColor, forKey: "bgColor")
        defaults.set(textColor, forKey: "textColor")
        defaults.set(switchOutlet.isOn, forKey: "switch")
        defaults.set(field.text, forKey: "field")
        defaults.set(lblMsg.text, forKey: "lblMsg")
    }
    
    let defaults = UserDefaults.standard
    
    // override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sBgColor = defaults.object(forKey: "bgColor"),
            let sTextColor = defaults.object(forKey: "textColor"),
            let sSwitch = defaults.object(forKey: "switch"),
            let sField = defaults.object(forKey: "field"),
            let sLblMsg = defaults.object(forKey: "lblMsg")
        {
            bgColor = sBgColor as! [Float]
            textColor = sTextColor as! [Float]
            switchOutlet.isOn = sSwitch as! Bool
            field.text = sField as? String
            lblMsg.text = sLblMsg as? String
            
            render()
            setSliderOutlets(switchOutlet.isOn ? bgColor : textColor)
        }
        else {
            reset()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveStates()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // saveStates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

