//
//  LogInViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/23/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class LogInViewController: UIViewController {

    //the outlet to the errors text
    @IBOutlet weak var Errors: UILabel!
    //these are the two strings that are updated
    var userNameText: String = " "
    var passWordText: String = " "
    var hi = " "
    
    //the user that we check that goes in
    var userToSendOver: User?
    
    //this is the textfield for the usernames and the passwords
    
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //this is the text for the username
    var usernameText: String{
        get{
            return usernameTextField.text!
        }
        set{
            userNameText=newValue
        }
    }
    
    
    //this is the text for the password
    var passwordText: String{
        get{
            return passwordTextField.text!
        }
        set{
            passWordText=newValue
        }
    }
    
    
    //prepares for segue
   override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
    
        //simulates the fake server if these two texts ar reached
        if(identifier == "SimulateThis"){
            let firstname="Lauren"
            let requestingUserName=NSFetchRequest(entityName: "User")
            requestingUserName.predicate=NSPredicate(format: "firstName = %@", firstname)
            let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
            let user = try? managedObjectContext!.executeFetchRequest(requestingUserName)
            
            //makes sure that there is a fake server that could be simulated
            
            if user == nil || user?.count<1{
                //username and password for the fake text
                if usernameText=="CountingOne"{
                    if passwordText=="CountingTwo"{
                        Errors.text=" "
                        return true
                    }
                        //error for wrong password
                    else{
                        Errors.text="Error: wrong password code"
                    }
                }
                //wrong user name code
                else{
                        Errors.text="Error: wrong username code"
                }
            }
            //data has been simulated
            else{
                Errors.text="Error: Data already simulated."
            }
            return false
        }
    
        //logging in identifier
        if(identifier == "Logging In"){
        
            //running a fetch request for a user was not nil. If, so then it will operate, if not then we 
            //cannot run this program.
            let requestingUserName=NSFetchRequest(entityName: "User")
            requestingUserName.predicate=NSPredicate(format: "username = %@", usernameText)
            let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
            let user = try? managedObjectContext!.executeFetchRequest(requestingUserName)
     
            
            //checks if the fetch request found the user
            if let ourUser = user{
                if let thisUser=ourUser.first{
                    if let correctUser=thisUser as? User{
                        //if the fetch request found the user, it checks if that is his or her password.
                        if(correctUser.password == passwordText){
                            userToSendOver=correctUser
                            Errors.text=" "
                            return true
                        }
                        else{
                            Errors.text="Error: Password is incorrect"
                        }
                    }
                }
                //if username is not found, there is an error.
                else{
                    Errors.text="Error: Could Not Find Username"
                }
                
            }
            //write again because user could be nul
            else{
                Errors.text="Error: Could Not Find Username"
        }
    }
    
    return false
    
    
    }
    
    //this is an identifier for logging into the function
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Logging In"){
            
            //sends over the user to the main view controller
                if let mainMenu=segue.destinationViewController as? MainViewController{
                    if userToSendOver != nil{
                        mainMenu.userObject=userToSendOver
                    }
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
