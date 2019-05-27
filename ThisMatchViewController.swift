//
//  ThisMatchViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 12/10/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

//Upload UserInterface is based off of Eric Chown's UpdateUI in FaceIt

class ThisMatchViewController: UIViewController {

    //the match user
    var user: NSManagedObject?{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the user who is loggedon
    var originalUser: NSManagedObject?{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the first name of the user in the outlet
    @IBOutlet weak var firstName: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the first name of the user in the text
    var firstNameText: String{
        get{
            return firstName.text!
        }
        set{
            firstName.text=newValue
        }
    }
    
    //the last name of the user in the outlet
    @IBOutlet weak var lastName: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }

    //the last name of the user in text
    var lastNameText: String{
        get{
            return lastName.text!
        }
        set{
            lastName.text=newValue
        }
    }
    
    //the name of the outlet for the baseballSkill
    @IBOutlet weak var baseballSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the text for the baseball skill
    var baseballSkillText: String{
        get{
            return baseballSkill.text!
        }
        set{
            baseballSkill.text=String(newValue)
        }
    }
    
    //the outlet for the basketball skill
    @IBOutlet weak var basketballSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the variable for the basketball skill
    var basketballSkillText: String{
        get{
            return basketballSkill.text!
        }
        set{
            basketballSkill.text=String(newValue)
        }
    }
    
    //the outlet for the tennis skill
    @IBOutlet weak var tennisSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the variable for the tennis skill
    var tennisSkillText: String{
        get{
            return tennisSkill.text!
        }
        set{
            tennisSkill.text=String(newValue)
        }
    }
    
    //the outlet for baseball years
    @IBOutlet weak var baseballYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the variable for baseball years
    var baseballYearsText: String{
        get{
            return baseballYears.text!
        }
        set{
            baseballYears.text=String(newValue)
        }
    }
    
    //the outlet for basketballYears
    @IBOutlet weak var basketballYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the variable for basketball Years
    var basketballYearsText: String{
        get{
            return basketballYears.text!
        }
        set{
            basketballYears.text=String(newValue)
        }
    }
    
    //the outlet for tennis years
    @IBOutlet weak var tennisYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //the variable for tennis years
    var tennisYearsText: String{
        get{
            return tennisYears.text!
        }
        set{
            tennisYears.text=String(newValue)
        }
    }
    
    //the outlet function for matching
    @IBAction func Match(sender: UIButton) {
        if let thisUser=user as? User{
            if let actualUser=originalUser as? User{
                //this makes the NSSet mutatable. This will then add the user to
                //request and rejected, so a request is called and rejected because the person
                //should not show up in suggested matches
                let requestingUser = thisUser.mutableSetValueForKey("request")
                requestingUser.addObject(actualUser)
                print(thisUser.request?.count)
                let rejectingUser=thisUser.mutableSetValueForKey("rejected")
                rejectingUser.addObject(actualUser)
                
            }
        }
    }
    
    //the outlet function for rejecting
    @IBAction func Reject(sender: UIButton) {
        if let thisUser=user as? User{
            if let actualUser=originalUser as? User{
                //this we just add to rejecting so that way the user isn't show anymore in suggested matches
                let rejectingUser=thisUser.mutableSetValueForKey("rejected")
                rejectingUser.addObject(actualUser)
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
    

    //uploadUserInterface is based off of updateUI by Professor Chown
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
    
    //segues back to the main menu for the user
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
