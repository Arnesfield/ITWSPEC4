//
//  ItemViewController.swift
//  Activity5
//
//  Created by Jefferson Rylee on 01/11/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    var currItem: Item?
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = self.currItem {
            self.itemName.text = item.name
            self.itemPrice.text = "₱\(item.price)"
            self.itemDesc.text = item.desc
            self.itemImg.image = UIImage(named: item.imgSrc)
        }
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
