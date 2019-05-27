//
//  ShowingTheMatchViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 12/14/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class ShowingTheMatchViewController: UIViewController {
    
    //variable for the user who's match we are looking at
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

    //variable for the firstNAme label
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

    //variable for the last name. uploads userInterface when
    //called
    @IBOutlet weak var lastName: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for the last name in get set form
    var lastNameText: String{
        get{
            return lastName.text!
        }
        set{
            lastName.text=newValue
        }
    }
    
    //variable for the baseballSkill. uploads userInterface when
    //called
    @IBOutlet weak var baseballSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    
    //variable for setting and getting the text for the text of the baseball Skill
    var baseballSkillText: String{
        get{
            return baseballSkill.text!
        }
        set{
            baseballSkill.text=String(newValue)
        }
    }
    
    
    //variable for the basketballSkill. uploads userInterface when
    //called
    @IBOutlet weak var basketballSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
        //variable for setting and getting the text for the text of the basketball Skill
    var basketballSkillText: String{
        get{
            return basketballSkill.text!
        }
        set{
            basketballSkill.text=String(newValue)
        }
    }
    
    
    //outlet for the tennisSkill. uploads userInterface when
    //called
    @IBOutlet weak var tennisSkill: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    var tennisSkillText: String{
        get{
            return tennisSkill.text!
        }
        set{
            tennisSkill.text=String(newValue)
        }
    }
    
    
    //outlet for the baseball Years. uploads userInterface when
    //called
    @IBOutlet weak var baseballYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    var baseballYearsText: String{
        get{
            return baseballYears.text!
        }
        set{
            baseballYears.text=String(newValue)
        }
    }

    //outlet for the last name. uploads userInterface when
    //called
    @IBOutlet weak var basketballYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for setting and getting the text for the text of the baseball Years
    var basketballYearsText: String{
        get{
            return basketballYears.text!
        }
        set{
            basketballYears.text=String(newValue)
        }
    }
    
    //outlet for the last name. uploads userInterface when
    //called
    @IBOutlet weak var tennisYears: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for setting and getting the text for the text of the
    //tennis years
    var tennisYearsText: String{
        get{
            return tennisYears.text!
        }
        set{
            tennisYears.text=String(newValue)
        }
    }

    
    @IBOutlet weak var phoneNumber: UILabel!{
        didSet{
            uploadUserInterface()
        }
    }
    
    //variable for setting and getting the text for the text in the
    var phoneNumberText: String{
        get{
            return phoneNumber.text!
        }
        set{
            phoneNumber.text=String(newValue)
        }
    }

    //this uploads the UI to update the labels that we created in this viewController.
    //these labels are the baseballSkill, basketballSkill, tennisSkill, baseballYears,
    //basketballYears, tennisYears, and firstName, lastName. Only sets these values if they
    //arent nil
    //this is adopted from Eric Chown's updateUI in FaceIt
    private func uploadUserInterface(){
        if (firstName != nil && lastName != nil && baseballSkill != nil && baseballYears != nil && basketballYears != nil && basketballSkill != nil && tennisSkill != nil && tennisYears != nil && phoneNumber != nil){
            print("yes we are here")
            if let chosenUser = user as? User{
                print("and we made it again")
                baseballSkillText=String(chosenUser.baseballSkill!)
                basketballSkillText=String(chosenUser.basketballSkill!)
                tennisSkillText=String(chosenUser.tennisSkill!)
                baseballYearsText=String(chosenUser.baseballYears!)
                basketballYearsText=String(chosenUser.basketballYears!)
                tennisYearsText=String(chosenUser.tennisYears!)
                firstNameText=String(chosenUser.firstName!)
                lastNameText=String(chosenUser.lastName!)
                phoneNumberText=String(chosenUser.phoneNumber!)
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
