//
//  ColorViewController.swift
//  ios-10-10-17
//
//  Created by Jefferson Rylee on 14/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    @IBAction func btnMsg(_ sender: Any) {
        self.showMsg()
    }
    @IBAction func btnAny(_ sender: Any) {
        txtMsg.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.showMsg()
        return true
    }
    
    private func showMsg() {
        lblMsg.text = txtMsg.text
        txtMsg.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtMsg.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
