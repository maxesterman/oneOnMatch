//
//  CharachteristicsViewController.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/16/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class CharachteristicsViewController: UIViewController {

    let brain = CharachteristicsBrain()
    
    
    //this is the label for the baseballSkill level
    //updates with didSet
    @IBOutlet weak var baseballSkill: UILabel!{
        didSet{
            if let checkUser=ourUser as? User{
            displayBaseballSkill=Int(checkUser.baseballSkill!)
            }
        }
    }
    
    //the user sent in
    var ourUser: NSManagedObject?
    
    
    //this is the variable that gets and sets the baseball skill variable
    var displayBaseballSkill: Int{
        get{
            return Int(baseballSkill.text!)!
        }
        set{
            baseballSkill.text = "\(newValue)"
        }
    }
    
    //adding one to the baseball skill variable
    @IBAction func baseballSkillPlus(sender: UIButton) {
        if(brain.changingUser != ourUser){
        brain.changingUser=ourUser
        }
        
        brain.changeNumberPlus("Baseball Skill")
        displayBaseballSkill=brain.baseballSkill
    }
    
    //subtracting one from baseball skill
    @IBAction func baseballSkillMinus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberMinus("Baseball Skill")
        displayBaseballSkill=brain.baseballSkill
    }
    
    //this is the label for the basketballSkill level
    //updates with didSet
    @IBOutlet weak var basketballSkill: UILabel!{
        didSet{
            if let checkUser=ourUser as? User{
                displayBasketballSkill=Int(checkUser.basketballSkill!)
            }
        }
    }
    
    
    //this is the variable that gets and sets the basketball skill variable
    var displayBasketballSkill: Int{
        get{
            return Int(basketballSkill.text!)!
        }
        set{
            basketballSkill?.text = "\(newValue)"
        }
    }
    
    
    //adding one to the basketball skill variable
    @IBAction func basketballSkillPlus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberPlus("Basketball Skill")
        displayBasketballSkill=brain.basketballSkill
        
    }
    
    //subtracting one from basketball skill
    @IBAction func basketballSkillMinus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberMinus("Basketball Skill")
        displayBasketballSkill=brain.basketballSkill
        
    }
    
    //this is the label for the tennisSkill level
    //updates with didSet
    @IBOutlet weak var tennisSkill: UILabel!{
        didSet{
            if let checkUser=ourUser as? User{
                displayTennisSkill=Int(checkUser.tennisSkill!)
            }
        }
    }
    
    //this is the variable that gets and sets the tennis skill variable
    var displayTennisSkill: Int{
        get{
            return Int(tennisSkill.text!)!
        }
        set{
            tennisSkill?.text = "\(newValue)"
        }
    }
    
    //adding one to the tennis skill variable
    @IBAction func tennisSkillPlus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberPlus("Tennis Skill")
        displayTennisSkill=brain.tennisSkill
    }
    
    
    //subtracting one from tennis skill
    @IBAction func tennisSkillMinus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberMinus("Tennis Skill")
        displayTennisSkill=brain.tennisSkill
    }
    
    //this is the label for the baseballYears
    //updates with didSet
    @IBOutlet weak var baseballYears: UILabel!{
        didSet{
            if let checkUser=ourUser as? User{
                displayBaseballYears=Int(checkUser.baseballYears!)
            }
        }
    }
    
    //this is the variable that gets and sets the baseball years variable
    var displayBaseballYears: Int{
        get{
            return Int(baseballYears.text!)!
        }
        set{
            baseballYears?.text = "\(newValue)"
        }
    }

    //adding one to the baseball years variable
    @IBAction func baseballYearsPlus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberPlus("Baseball Years")
        displayBaseballYears=brain.baseballYears
        
    }
    
    //subtracting one from baseball Years
    @IBAction func baseballYearsMinus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberMinus("Baseball Years")
        displayBaseballYears=brain.baseballYears
        
    }
    
    
    //this is the label for the basketballYears
    //updates with didSet
    @IBOutlet weak var basketballYears: UILabel!{
        didSet{
            if let checkUser=ourUser as? User{
                displayBasketballYears=Int(checkUser.basketballYears!)
            }
        }
    }
    
        //this is the variable that gets and sets the basketball years variable
    var displayBasketballYears: Int{
        get{
            return Int(basketballYears.text!)!
        }
        set{
            basketballYears?.text = "\(newValue)"
        }
    }
    
    //adding one to the basketball years variable
    @IBAction func basketballYearsPlus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberPlus("Basketball Years")
        displayBasketballYears=brain.basketballYears
    }
    
    //subtracting one from basketball Years
    @IBAction func basketballYearsMinus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberMinus("Basketball Years")
        displayBasketballYears=brain.basketballYears
    }
    
    
    //this is the label for the tennisYears
    //updates with didSet
    @IBOutlet weak var tennisYears: UILabel!{
        didSet{
            if let checkUser=ourUser as? User{
                displayTennisYears=Int(checkUser.tennisYears!)
            }
        }
    }
    
        //this is the variable that gets and sets the tennis years variable
    var displayTennisYears: Int{
        get{
            return Int(tennisYears.text!)!
        }
        set{
            tennisYears?.text = "\(newValue)"
        }
    }
    
    //adding one to the tennis years variable
    @IBAction func tennisYearsPlus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberPlus("Tennis Years")
        displayTennisYears=brain.tennisYears
    
    }
    
    //subtracting one from tennis variable
    @IBAction func tennisYearsMinus(sender: UIButton) {
        if(brain.changingUser != ourUser){
            brain.changingUser=ourUser
        }
        brain.changeNumberMinus("Tennis Years")
        displayTennisYears=brain.tennisYears
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
}
