//
//  SignUpViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/22/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    //actual string and numbers for the attributes variables
    
    var userNameText: String=" "
    var passWordText: String=" "
    var firstNameText: String=" "
    var lastNameText: String=" "
    var phoneNumberInt: Int=0
    
    //these are the labels for the outlets
    
    @IBOutlet weak var Errors: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    //variables for the attributes
    
    var usernameText: String{
        get{
            return usernameTextField.text!
        }
        set{
            userNameText = newValue
        }
    }
    
    var passwordText: String{
        get{
            return passwordTextField.text!
        }
        set{
            passWordText = newValue
        }
    }
    
    var firstnameText: String{
        get{
            return firstNameTextField.text!
        }
        set{
            firstNameText=newValue
        }
    }
    
    var lastnameText: String{
        get{
            return lastNameTextField.text!
        }
        set{
            lastNameText=newValue
        }
    }
    
    var phonenumberNumber: Int{
        get{
            return Int(phoneNumber.text!)!
        }
        set{
            phoneNumberInt=newValue
        }
    }
    
    
    var hi = " "
    
    
    
    //gotten this from smashtag by eric chown creets the managedObjectContext
   var managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext



    

    
    
    @IBAction func Enter(sender: UIButton) {
        
        
        
      /*  if(userNameText.characters.count < 5){
            if(passWordText.characters.count < 8){
                Errors.text="Error: Username has to have at least 5 charachters and Password has to have at least 8 charachters"
            }
            else{
                Errors.text="Error: Username has to have at least 5 charachters"
            }
        }
        else if(passWordText.characters.count < 8){
            Errors.text="Error: Password has to have at least 8 charachters"
        }
        else{
         
        let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: managedObjectContext!)
            
            
        //user.setValue(userNameText, forKey: "Username")
        //user.setValue(userNameText, forKey: "PassWord")
        
        
        }
        
       */
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(false, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "You Are Signed Up"{
            //this is to check if the database has been set up. We don't want to resimulate the same data
            let firstname="Lauren"
            let requestingUserName=NSFetchRequest(entityName: "User")
            requestingUserName.predicate=NSPredicate(format: "firstName = %@", firstname)
            let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
            let user = try? managedObjectContext!.executeFetchRequest(requestingUserName)
            //checks for specific counts of the username and the password
            if user != nil{
                if user!.count > 0 {
                    if(usernameText.characters.count < 5){
                        if(passwordText.characters.count < 8){
                            Errors.text="Error: Username has to have at least 5 charachters and Password has to have at least 8 charachters"
                        }
                        else{
                            Errors.text="Error: Username has to have at least 5 charachters"
                        }
                    }
                    else if(passwordText.characters.count < 8){
                        Errors.text="Error: Password has to have at least 8 charachters"
                    }
                    else if(firstnameText.characters.count < 2 || lastnameText.characters.count < 2){
                        Errors.text="Error: First and Last Names needs to have at least two characters"
                    }
                    else if(phonenumberNumber < 1000000000 || phonenumberNumber >= 10000000000){
                        Errors.text="Error: Phone Number needs to have 10 digits"
                    }
                    else {
                        //checks if the username exists
                        let newNameRequest=NSFetchRequest(entityName: "User")
                            newNameRequest.predicate=NSPredicate(format: "username = %@", usernameText)
                        let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
                        let secondTestUser = try? managedObjectContext!.executeFetchRequest(newNameRequest)
                        //if user name exists, then we show an error
                        if secondTestUser != nil{
                            if secondTestUser?.count>0{
                                Errors.text="Error: Username already exists."
                            }
                            else{
                                return true
                            }
                        }
                        else{
                            return true
                        }

                    }
                }
                else{
                    //once we get to these else statements, we know that the data hasn't been simulated
                    Errors.text="Error: server has not been installed. You have to simulate data first."
                }
            }
            else{
                Errors.text="Error: server has not been installed. You have to simulate data first."
            }
        }
        return false
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       if(segue.identifier == "You Are Signed Up"){
                managedObjectContext?.performBlock(){
                
                    //creates a new user
                let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: self.managedObjectContext!)
                    
                    
                    //sets the values for the user
                user.setValue(self.usernameText, forKey: "username")
                user.setValue(self.passwordText, forKey: "password")
                user.setValue(0, forKey: "tennisSkill")
                user.setValue(0, forKey: "baseballSkill")
                user.setValue(0, forKey: "basketballSkill")
                user.setValue(0, forKey: "baseballYears")
                user.setValue(0, forKey: "tennisYears")
                user.setValue(0, forKey: "basketballYears")
                user.setValue(self.phonenumberNumber, forKey: "phoneNumber")
                user.setValue(self.firstnameText, forKey: "firstName")
                user.setValue(self.lastnameText, forKey: "LastName")
                    
                //sends the user to the mainview controller
                if let mainMenu=segue.destinationViewController as? MainViewController{
                    mainMenu.userObject=user
                }
            }
        
        }
    }

        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
}
    

//}
