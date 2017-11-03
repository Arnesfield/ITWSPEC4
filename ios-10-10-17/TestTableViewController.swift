//
//  TestTableViewController.swift
//  PracticalQuiz1
//
//  Created by JEFFERSON RYLEE ESPIRITU on 03/11/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class TestTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private static var ITEMS: [Item] = [
        Item(name: "Apple", desc: "Red Apple", imgSrc: "apple"),
        Item(name: "Cherry", desc: "Tasty", imgSrc: "cherry"),
        Item(name: "Coffee", desc: "Nice Coffee", imgSrc: "coffee"),
        Item(name: "Food", desc: "Good food", imgSrc: "food"),
        Item(name: "Orange", desc: "Orangey orange", imgSrc: "orange"),
        Item(name: "Raspberry", desc: "Nice nice", imgSrc: "raspberry"),
    ]
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbltTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        img.image = UIImage(named: TestTableViewController.ITEMS[0].imgSrc)
        lbltTitle.text = TestTableViewController.ITEMS[0].name
        lblDetail.text = TestTableViewController.ITEMS[0].desc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TestTableViewController.ITEMS.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        img.image = UIImage(named: TestTableViewController.ITEMS[indexPath.row].imgSrc)
        lbltTitle.text = TestTableViewController.ITEMS[indexPath.row].name
        lblDetail.text = TestTableViewController.ITEMS[indexPath.row].desc
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell", for: indexPath)

        cell.textLabel?.text = TestTableViewController.ITEMS[indexPath.row].name
        cell.detailTextLabel?.text = TestTableViewController.ITEMS[indexPath.row].desc
        cell.imageView?.image = UIImage(named: TestTableViewController.ITEMS[indexPath.row].imgSrc)

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
