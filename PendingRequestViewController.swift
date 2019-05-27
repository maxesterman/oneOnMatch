//
//  PendingRequestViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 12/13/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class PendingRequestViewController: UIViewController {

    //this is the user whose request is being called
    var user: NSManagedObject?{
        didSet{
            uploadUserInterface()
        }
    }
    
    //this is the user who's account we are currently in
    var originalUser: NSManagedObject?{
        didSet{
            uploadUserInterface()
        }
    }
    
    //this is the firstName of the person that we are using
    @IBOutlet weak var firstName: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //this is the variable for the text of the firstName
    var firstNameText: String{
        get{
            return firstName.text!
        }
        set{
            firstName.text=newValue
        }
    }
    
    //outlet for last name
    @IBOutlet weak var lastName: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for last name
    var lastNameText: String{
        get{
            return lastName.text!
        }
        set{
            lastName.text=newValue
        }
    }

    //outlet for baseball skill
    @IBOutlet weak var baseballSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for baseball skill
    var baseballSkillText: String{
        get{
            return baseballSkill.text!
        }
        set{
            baseballSkill.text=String(newValue)
        }
    }
    
    
    //outlet for basketballSkill
    @IBOutlet weak var basketballSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for basketball skill
    var basketballSkillText: String{
        get{
            return basketballSkill.text!
        }
        set{
            basketballSkill.text=String(newValue)
        }
    }
    
    //outlet for tennis skill
    @IBOutlet weak var tennisSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for tennis skill
    var tennisSkillText: String{
        get{
            return tennisSkill.text!
        }
        set{
            tennisSkill.text=String(newValue)
        }
    }

    //outlet for baseball years
    @IBOutlet weak var baseballYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for baseballYears
    var baseballYearsText: String{
        get{
            return baseballYears.text!
        }
        set{
            baseballYears.text=String(newValue)
        }
    }

    //outlet for baseball Years
    @IBOutlet weak var basketballYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for basketball Years
    var basketballYearsText: String{
        get{
            return basketballYears.text!
        }
        set{
            basketballYears.text=String(newValue)
        }
    }

    //outlet for tennis Years
    @IBOutlet weak var tennisYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for setting and getting the text for the text in the
    var tennisYearsText: String{
        get{
            return tennisYears.text!
        }
        set{
            tennisYears.text=String(newValue)
        }
    }

    //this uploads the UI to update the labels that we created in this viewController.
    //these labels are the baseballSkill, basketballSkill, tennisSkill, baseballYears,
    //basketballYears, tennisYears, and firstName, lastName. Only sets these values if they
    //arent nil
    //this is adopted from Eric Chown's updateUI in FaceIt
    private func uploadUserInterface(){
        if (firstName != nil && lastName != nil && baseballSkill != nil && baseballYears != nil && basketballYears != nil && basketballSkill != nil && tennisSkill != nil && tennisYears != nil){
            if let chosenUser = user as? User{
                baseballSkillText=String(chosenUser.baseballSkill!)
                basketballSkillText=String(chosenUser.basketballSkill!)
                tennisSkillText=String(chosenUser.tennisSkill!)
                baseballYearsText=String(chosenUser.baseballYears!)
                basketballYearsText=String(chosenUser.basketballYears!)
                tennisYearsText=String(chosenUser.tennisYears!)
                firstNameText=String(chosenUser.firstName!)
                lastNameText=String(chosenUser.lastName!)
            }
        }
    }
    
    
    //this is what happen when the match button is hit. in this, we add the
    @IBAction func match(sender: UIButton) {
        if let thisUser=user as? User{
            if let actualUser=originalUser as? User{
                //found how to do this from
                let matchingUser = thisUser.mutableSetValueForKey("matcher")
                matchingUser.addObject(actualUser)
                print(thisUser.request?.count)
                let deletingUser=actualUser.mutableSetValueForKey("request")
                deletingUser.removeObject(thisUser)
                
            }
        }
        
    }
    
    //this is the reject button. In this, we make sure that the user is
    //removed from the request list because in the previous list
    //we put it on the requested list.
    @IBAction func reject(sender: UIButton) {
    
        if let thisUser=user as? User{
            if let actualUser=originalUser as? User{
                //from https://code.tutsplus.com/tutorials/core-data-and-swift-relationships-and-more-fetching--cms-25070
                //creates a mutable array to static nsset to create a new object
                let deletingUser=actualUser.mutableSetValueForKey("request")
                deletingUser.removeObject(thisUser)

            }
        }
    }
    
    
    //segues back to the main menu for the user, ame thing happens if user matches or
    //rejects
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Match to Main Menu"){
            if let theDestinedVC=segue.destinationViewController as? MainViewController{
                theDestinedVC.userObject=originalUser
            }
        }
        if(segue.identifier == "Reject to Main Menu"){
            if let theDestinedVC=segue.destinationViewController as? MainViewController{
                theDestinedVC.userObject=originalUser
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
