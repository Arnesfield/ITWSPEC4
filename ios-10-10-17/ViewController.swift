//
//  ViewController.swift
//  ios-10-10-17
//
//  Created by JEFFERSON RYLEE ESPIRITU on 10/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMsg: UITextField!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtMsg.resignFirstResponder()
        return true
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

