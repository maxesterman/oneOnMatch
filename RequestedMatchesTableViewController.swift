//
//  RequestedMatchesTableViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 12/11/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class RequestedMatchesTableViewController: UITableViewController {

    //the users for the object
    var user: NSManagedObject?
    var listOfRequestingUsers: [Array<AnyObject>]=[]
    
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
            return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let thisUser=user as? User{
            print(thisUser.request?.count)
            return thisUser.request?.count ?? 0
        }
        else{
            return 0
        }
    }

    //creating the tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //this is the request of the users and we put them in an array
        if let thisUser=user as? User{
            if let requestedUsers=thisUser.request {
            listOfRequestingUsers=[Array(requestedUsers)]
        
            }
        }
            //sets cell for a user
            let data=listOfRequestingUsers[indexPath.section][indexPath.row]
        //sets path for users
        let cell=tableView.dequeueReusableCellWithIdentifier("Reuse Identifier", forIndexPath: indexPath)
        
        //creates the text label name for the data
        if let ourData=data as? User{
            cell.textLabel?.text = ourData.firstName!+" "+ourData.lastName!
        }
        else{
            cell.textLabel?.text = "wrongname"
        }
        
        

        // Configure the cell...

            
            return cell

        //
    }
    
    //From Stanford's Lecture 9 slides on prepare for segue back to the previous slide
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Show The Request"){
            if let cell=sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell), let theDestinedVC = segue.destinationViewController as? PendingRequestViewController{
                
                let data=listOfRequestingUsers[indexPath.section][indexPath.row]
                if let sendingUser=data as? User{
                        theDestinedVC.user=sendingUser
                        theDestinedVC.originalUser=user
                }
                
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
