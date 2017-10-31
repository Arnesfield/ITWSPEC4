//
//  ItemTableViewController.swift
//  Activity5
//
//  Created by Jefferson Rylee on 31/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

    private let ITEMS: [Item] = [
        Item(name: "Apple", desc: "Red Apple", price: 18.50, imgSrc: "apple"),
        Item(name: "School Bag", desc: "To keep things", price: 249.5, imgSrc: "bag"),
        Item(name: "Beverage", desc: "Refreshments first", price: 14, imgSrc: "beverage"),
        Item(name: "Book", desc: "For learning", price: 50.6, imgSrc: "book"),
        Item(name: "Calculator", desc: "To calculate things", price: 359.5, imgSrc: "calculator"),
        Item(name: "Cherry", desc: "Sweet and tasty", price: 30.75, imgSrc: "cherry"),
        Item(name: "Cup of Coffee", desc: "Hyper yourself", price: 56, imgSrc: "coffee"),
        Item(name: "Food", desc: "Fill your stomach", price: 160, imgSrc: "food"),
        Item(name: "Hand Soap", desc: "Clean your hands", price: 120, imgSrc: "handsoap"),
        Item(name: "Notebook", desc: "To be written on", price: 28.75, imgSrc: "notebook"),
        Item(name: "Orange", desc: "Sweet Orange", price: 19.00, imgSrc: "orange"),
        Item(name: "Paper", desc: "To be written on", price: 22, imgSrc: "paper"),
        Item(name: "Pencil", desc: "Write things", price: 10, imgSrc: "pencil"),
        Item(name: "Raspberry", desc: "1 pack of sweet raspberry", price: 35.00, imgSrc: "raspberry"),
        Item(name: "Tissues", desc: "Wipe things", price: 30, imgSrc: "tissues"),
        Item(name: "Bottled Water", desc: "Cool drink", price: 15, imgSrc: "water"),
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ItemViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            vc.currItem = ITEMS[indexPath.row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ITEMS.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemID", for: indexPath)
        cell.textLabel?.text = ITEMS[indexPath.row].name
        cell.detailTextLabel?.text = "₱\(ITEMS[indexPath.row].price)"
        cell.imageView?.image = UIImage(named: ITEMS[indexPath.row].imgSrc)
        return cell
    }
    

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
