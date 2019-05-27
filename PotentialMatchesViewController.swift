//
//  PotentialMatchesViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 12/10/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

//UploadUserInterface based off of UIupload in Face It by Eric Chown

class PotentialMatchesViewController: UIViewController {

    //variables to be used
    var ourObjects: [AnyObject]?
    var ourUsers: [User]=[]
    var ourDoubles: [Double]=[]
    
    //this is the managedObjectContext from Eric Chown
    let newManagedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    //the user
    var user: NSManagedObject?{
        didSet{
            uploadUserInterface()
            print("update")
        }
    }
    
    //the scores
    var theScores=calculatingScore()
    
    var number=0
    
    //function to get all the Users who haven't been matched or rejected (just simply rejected)
    //and put them in an array
    private func getAllTheObjects() {
        if let thisContext = newManagedObjectContext{
            if let ourUser = user as? User{
                let request = NSFetchRequest(entityName: "User")
                request.predicate=NSPredicate(format: "firstName != %@ OR lastName != %@", ourUser.firstName!, ourUser.lastName!)
                let newUsers = try? thisContext.executeFetchRequest(request)
                ourObjects=newUsers
            }
        }
    
        
        if let comparedUsers=ourObjects as? [User]{
            if let ourUser = user as? User{
                for comparedUser in comparedUsers{
                    if ourUser.rejected != nil{
                        if(!ourUser.rejected!.containsObject(comparedUser)){
                            if let calculatedScore=theScores.calculatingScore(ourUser, userToCompare: comparedUser){
                                ourDoubles.append(calculatedScore)
                                number += 1
                                print(number)
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    private func returnTopFivePeople(){
        //secures all our numbers
        let tempDoubles = ourDoubles
        var ourNormalDictionary=theScores.ourscoreDictionary
        ourUsers=[]
        for _ in 1..<6{
            //this compares each user with who they score by finidng max element and 
            //that index
            if let maxelement=ourDoubles.maxElement(){
                let maxelementindex=ourDoubles.indexOf(maxelement)
                //the compared users are then found and we try to get their scores
                if let comparedUsers=ourObjects as? [User]{
                    for comparedUser in comparedUsers{
                        if ourNormalDictionary[comparedUser] != nil{
                            if ourNormalDictionary[comparedUser] == maxelement{
                                ourUsers.append(comparedUser)
                                ourNormalDictionary.removeValueForKey(comparedUser)
                            }
                        }
                    }
                }
                ourDoubles.removeAtIndex(maxelementindex!)
                
            }
        }
        //after for loop is over, we get back the doubles array
        ourDoubles=tempDoubles
    }

    //This is UploadUserInterface based on Eric Chown's UpdateUI in Face It
    private func uploadUserInterface(){
        if (userOneText != nil && userTwoText != nil && userThreeText != nil && userFourText != nil && userFiveText != nil){
            //calls to get all the users and return the top 5
            getAllTheObjects()
            returnTopFivePeople()
            //this is to add the users for each name
            if ourUsers.count>0{
                displayUserOne=ourUsers[0].firstName!+" "+ourUsers[0].lastName!
                if ourUsers.count>1{
                    displayUserTwo=ourUsers[1].firstName!+" "+ourUsers[1].lastName!
                    
                    if ourUsers.count>2{
                        displayUserThree=ourUsers[2].firstName!+" "+ourUsers[2].lastName!
                        if ourUsers.count>3{
                            displayUserFour=ourUsers[3].firstName!+" "+ourUsers[3].lastName!
                            if ourUsers.count>4{
                                displayUserFive=ourUsers[4].firstName!+" "+ourUsers[4].lastName!
                            }
                            else{
                                displayUserFive=" "
                            }
                            
                        }
                        else{
                            displayUserFour=" "
                        }
                        
                    }
                    else{
                        displayUserThree=" "
                    }
                }
                else{
                    displayUserTwo=" "
                }
            }
            else{
                displayUserOne=" "
            }
        }
    }
    
    //Below are the outlets for the five texts
    
    @IBOutlet weak var userOneText: UIButton!{
        didSet{
            uploadUserInterface()
            print("update one")
        }
    }
    
    
    @IBOutlet weak var userTwoText: UIButton!{
        didSet{
            uploadUserInterface()
            print("update two")
        }
    }
    
    
    @IBOutlet weak var userThreeText: UIButton!{
        didSet{
            uploadUserInterface()
            print("update three")
        }
    }
    
    
    @IBOutlet weak var userFourText: UIButton!{
        didSet{
            uploadUserInterface()
            print("update four")
        }
    }
    
    
    @IBOutlet weak var userFiveText: UIButton!{
        didSet{
            uploadUserInterface()
            print("update five")
        }
    }
    
    
    //these are the variables to display the five users
    
    var displayUserOne: String{
        get{
            return userOneText!.currentTitle!
        }
        set{
            userOneText.setTitle(newValue, forState: .Normal)
        }
    }
    
    var displayUserTwo: String{
        get{
            return userTwoText!.currentTitle!
        }
        set{
            userTwoText.setTitle(newValue, forState: .Normal)
        }
    }
    
    var displayUserThree: String{
        get{
            return userThreeText!.currentTitle!
        }
        set{
            userThreeText.setTitle(newValue, forState: .Normal)
        }
    }
   
    var displayUserFour: String{
        get{
            return userFourText!.currentTitle!
        }
        set{
            userFourText.setTitle(newValue, forState: .Normal)
        }
    }
    
    
    var displayUserFive: String{
        get{
            return userFiveText!.currentTitle!
        }
        set{
            userFiveText.setTitle(newValue, forState: .Normal)
        }
    }
    
    

    
    @IBAction func userOne(sender: UIButton) {
    }
    
    @IBAction func userTwo(sender: UIButton) {
    }
    

    @IBAction func userThree(sender: UIButton) {
    }
    
    @IBAction func userFour(sender: UIButton) {
    }
    
    
    @IBAction func userFive(sender: UIButton) {
    }
    //prepare for segue to each user
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "User One"{
            if let theDestinedVC = segue.destinationViewController as? ThisMatchViewController{
                theDestinedVC.user=ourUsers[0]
                theDestinedVC.originalUser=user
            }
        }
        if segue.identifier == "User Two"{
            if let theDestinedVC = segue.destinationViewController as? ThisMatchViewController{
                theDestinedVC.user=ourUsers[1]
                theDestinedVC.originalUser=user

            }
        }
        if segue.identifier == "User Three"{
            if let theDestinedVC = segue.destinationViewController as? ThisMatchViewController{
                theDestinedVC.user=ourUsers[2]
                theDestinedVC.originalUser=user

            }
        }
        if segue.identifier == "User Four"{
            if let theDestinedVC = segue.destinationViewController as? ThisMatchViewController{
                theDestinedVC.user=ourUsers[3]
                theDestinedVC.originalUser=user

            }
        }
        if segue.identifier == "User Five"{
            if let theDestinedVC = segue.destinationViewController as? ThisMatchViewController{
                theDestinedVC.user=ourUsers[4]
                theDestinedVC.originalUser=user

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
