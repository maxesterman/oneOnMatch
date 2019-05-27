//
//  SimulatedDataViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 12/2/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class SimulatedDataViewController: UIViewController {
    
    //simulates the users
    @IBAction func simulate(sender: UIButton) {
        simulateAThousandUsers()
    }
    //gotten this from smashtag by eric chown creets the managedObjectContext
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    
    //in this spot, we create 100 first names and last names, using the for loop below, we create a new database with a 1000 users to start
    let firstNames: [String]=["Adam", "Craig", "Sarah", "Sara", "Sam", "Bob", "Bill", "John", "Jacob", "Ryan", "Matthew", "Thomas", "Tom", "Jill", "Jared", "Jeff", "Sean", "Ray", "Raymond", "Brad", "Max", "Maxwell", "Frank", "Steve", "Kyle", "Cole", "Jorge", "Janice", "Will", "William", "Dick", "Richard", "Alex", "Alexandra", "Alexander", "Molly", "Steven", "Stephen", "Xenu", "Zachary", "Naphtali", "Antonio", "Kylie", "Kylee", "Nicole", "Nichole", "Manlio", "Jonathan", "Joseph", "Jacob", "Jake", "William", "Maxine", "Mark", "Stephanie", "Steph", "Greg", "Gregory", "Brad", "Bradley", "Carlos", "Christian", "Chris", "Westley", "Noah", "Noam", "Dan", "Daniel", "Marcus", "Jackson", "Andre", "Dak", "Ezekiel", "Eli", "Brandon", "Aaron", "Benjamin", "Elijah", "Jeremiah", "Johnny", "Claudia", "Claudio", "Violet", "Margaret", "Megan", "Meg", "Meaghan", "Izzy", "Isabel", "Julius", "Taylor", "Tyrone", "Rodrigo", "Diego", "Luke", "Simon", "Barmotholomew", "Jay", "Tracy", "Silas", "Lauren", "Hunter", "Tim", "Timothy", "Zoe", "Zoey", "Lara", "Laura", "Erin", "Roger", "Abraham", "Ishmael", "Maximillion", "Mordechai", "Paul"]
    
    //the for loop creates user names
    let lastNames: [String]=["Manziel", "Mansfield", "White", "Johnson", "Jackson", "Blake", "Sterman", "Brightside", "Crowley", "Best", "Abel", "Monetzuma", "Gonzalez", "Lopez", "Mendoz", "Enrique", "Williams", "Benson", "Brittle", "Guantanamo", "Carleton", "Banks", "Barkley", "Manning", "Fanning", "Pitt", "Lowe", "Jones", "Jefferies", "Stanley", "Prescott", "Schwarz", "Short", "Sheen", "Putz", "Green", "Goldberg", "Greenberg", "Jacobson", "Price", "Powers", "Williamson", "Waters", "Gilmour", "Mason", "Wright", "Webber", "Barker", "Cooper", "Gherig", "Greg", "Luther", "Lincoln", "Lawerence", "Levine", "Ranch", "Andre", "Burress", "Snow", "Jonathan", "Mills", "Rose", "Spacey", "Moulton", "Thorne", "Fitzpatrick", "Fitzgerald", "Fitzpatrick", "Chown", "Close", "Connelly", "Zeeman", "Nichols", "Shwifty", "Stoneberg", "Davis", "Richards", "Richardson", "Yarborough", "Yeltsin", "Gorbachev", "Krusuchev", "Lennon", "Lenox", "Windsor", "Ali", "Clay", "Fairbanks", "Foster", "Fieldson", "Morgan", "Brezhnez", "Bush", "Clinton", "Roosevelet", "Hamilton", "McCartney", "McCarthey", "Moore", "Idol", "Quayle", "Colbert", "Steward", "Dwight", "Pass", "Cranston", "Anniston", "Johansonn", "Jordan", "Jacob", "Warner", "Werner", "Shapot", "Ninyo", "Lewitz", "Lopez", "Miranda", "Pavano", "Jeter", "Hastings", "Steinbeck", "Tennessee", "Simmons", "Sheppard", "Lyle", "Woolery", "Burr"]

    //in this case, we crete a thousand users. In this case we create fake data for every attribute for them
    //including their user name, password, tennisSkill, baseballSkill, basketballSkill, baseballYears, tennisYears,
    //basketballYears, and
    func simulateAThousandUsers(){
        for i in 1...100{
            for j in 1...10{
                //making sure that users are created in a safe block
                managedObjectContext?.performBlock(){
                
                    //creating the user
                    let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: self.managedObjectContext!)
                
                    //here are create the values of the users. I usemodular arithematic for tennis and 
                    //baseballYears to be able to sufficiently create the results for tennisYears, baseballYears,
                    //and basketball Years
                    let userName=self.firstNames[i]+self.lastNames[i+j]+"eee"
                    let passWord=self.lastNames[i+j]+"eeee"
                    let tennisSkill=(i%10)+1
                    let baseballSkill=j
                    let basketballSkill=((i+j)%10)+1
                    let tennisYears=Int(i%30)
                    let baseballYears=Int(i%31)
                    let basketballYears=Int(i%29)
                    let phoneNumberEntered=Int(i+(j*100)+4444444444)
                    
                    
                    
                    //set the values created to the numbers entered above
                    user.setValue(userName, forKey: "username")
                    user.setValue(passWord, forKey: "password")
                    user.setValue(tennisSkill, forKey: "tennisSkill")
                    user.setValue(baseballSkill, forKey: "baseballSkill")
                    user.setValue(basketballSkill, forKey: "basketballSkill")
                    user.setValue(tennisYears, forKey: "baseballYears")
                    user.setValue(baseballYears, forKey: "tennisYears")
                    user.setValue(basketballYears, forKey: "basketballYears")
                    user.setValue(phoneNumberEntered, forKey: "phoneNumber")
                    user.setValue(self.firstNames[i], forKey: "firstName")
                    user.setValue(self.lastNames[i+j], forKey: "LastName")
                    
                    print("first name:")
                    print(self.firstNames[i])
                    print("last name:")
                    print(self.lastNames[i+j])
                    print("username:")
                    print(userName)
                    print("password:")
                    print(passWord)
                    print(" ")
                    
                    
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
