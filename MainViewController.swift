//
//  ViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/16/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    //new userObject to control the user
    var userObject: NSManagedObject?
    
    //using the segue to send in the objects from the main view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //sends to the charachteristicsViewController the user
        if(segue.identifier == "Charachteristics"){
            if let thedestinedVC=segue.destinationViewController as? CharachteristicsViewController{
                if let aUser=userObject as? User{
                    thedestinedVC.ourUser=aUser
                }
            }
        }
        
        //sends to the potential matches controller, the user
        if (segue.identifier == "Potential Matches"){
            if let thedestinedVC=segue.destinationViewController as? PotentialMatchesViewController{
                if let aUser=userObject as? User{
                    thedestinedVC.user=aUser
                }
            }
        }
        
        //sends to the requested matches view controller all the match requests
        if (segue.identifier == "Match Request"){
            if let thedestinedVC=segue.destinationViewController as? RequestedMatchesTableViewController{
                if let aUser=userObject as? User{
                    thedestinedVC.user=aUser
                }
            }
        }
        
        //sends to the matches view controller, all the matches
        if(segue.identifier == "Matches"){
            if let thedestinedVC=segue.destinationViewController as? MatchesTableViewController{
                if let aUser=userObject as? User{
                    thedestinedVC.user=aUser
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hides back button. figured out from http://stackoverflow.com/questions/27373812/swift-how-to-hide-back-//button-in-navigation-item
        //self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

