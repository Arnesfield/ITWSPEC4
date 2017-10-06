//
//  ViewController.swift
//  sample1
//
//  Created by JEFFERSON RYLEE ESPIRITU on 03/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    @IBAction func btnMsg(_ sender: Any) {
        lblMsg.text = txtMsg.text
        txtMsg.resignFirstResponder()
    }
    
    @IBAction func btnClose(_ sender: Any) {
        txtMsg.resignFirstResponder()
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

