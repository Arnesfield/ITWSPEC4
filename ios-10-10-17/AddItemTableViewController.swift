//
//  AddItemTableViewController.swift
//  Activity5
//
//  Created by Jefferson Rylee on 01/11/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDesc: UITextView!
    @IBOutlet weak var itemPrice: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBAction func btnClear(_ sender: Any) {
        self.itemName.text = ""
        self.itemDesc.text = ""
        self.itemPrice.text = ""
        lblError.text = "All fields are required."
    }
    private func btnSave() -> Bool {
        guard let name = itemName.text, !name.isEmpty else {
            lblError.text = "Name is required."
            return false
        }
        
        guard let desc = itemDesc.text, !desc.isEmpty else {
            lblError.text = "Description is required."
            return false
        }
        
        guard let sPrice = itemPrice.text, let price = Double(sPrice) else {
            lblError.text = "Price should be a number."
            return false
        }
        
        self.item = Item(name: name, desc: desc, price: price, imgSrc: "cart")
        return true
    }
    
    private var item: Item?
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let willSave: Bool = btnSave()
        if willSave {
            lblError.text = "All fields are required."
        }
        return willSave
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ItemTableViewController
        vc.addItem(self.item)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblError.text = "All fields are required."

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
