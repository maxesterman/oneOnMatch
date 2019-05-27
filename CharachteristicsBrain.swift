//
//  CharachteristicsBrain.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/16/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import Foundation
import CoreData


class CharachteristicsBrain{
    
    //this is the user that we wend in
    var changingUser: NSManagedObject?
    
    //In this section, I add a year or skill number for the user before I preform it.
    //Then, I am able to use this dd the number. For skills, I won't let anything above 10 and above a 99 for years
    func changeNumberPlus(attribute: String){
        if attribute=="Tennis Years"{
            let savednumber=tennisYears
            if(savednumber<99){
                tennisYears = savednumber+1
            }
        }
        if attribute=="Baseball Years"{
            let savednumber=baseballYears
            if(savednumber<99){
                baseballYears = savednumber+1
            }
        }
        if attribute=="Basketball Years"{
            let savednumber=basketballYears
            if(savednumber<99){
                basketballYears = savednumber+1
            }
        }
        if attribute=="Tennis Skill"{
            let savednumber=tennisSkill
            if(savednumber<10){
                tennisSkill = savednumber+1
            }
        }
        if attribute=="Baseball Skill"{
            let savednumber=baseballSkill
            if(savednumber<10){
                baseballSkill = savednumber+1
            }
        }
        if attribute=="Basketball Skill"{
            let savednumber=basketballSkill
            if(savednumber<10){
                basketballSkill = savednumber+1
            }
        }
        
    }
    
    
    //In this section, I add a year or skill number for the user before I preform it.
    //Then, I am able to use this subtract one formthe number. For skills, I won't let anything below 0
    func changeNumberMinus(attribute: String){
        if attribute=="Tennis Years"{
            let savednumber=tennisYears
            if(savednumber>0){
            tennisYears = savednumber-1
            }
        }
        if attribute=="Baseball Years"{
            let savednumber=baseballYears
            if(savednumber>0){
                baseballYears = savednumber-1
            }
        }
        if attribute=="Basketball Years"{
            let savednumber=basketballYears
            if(savednumber>0){
                basketballYears = savednumber-1
            }
        }
        if attribute=="Tennis Skill"{
            let savednumber=tennisSkill
            if(savednumber>0){
                tennisSkill = savednumber-1
            }
        }
        if attribute=="Baseball Skill"{
            let savednumber=baseballSkill
            if(savednumber>0){
                baseballSkill = savednumber-1
            }
        }
        if attribute=="Basketball Skill"{
            let savednumber=basketballSkill
            if(savednumber>0){
                basketballSkill = savednumber-1
            }
        }
    }
    
    //variable for tennis Years. Get returns an integer of the basketball years: as it is in NSNumber form. Also will set the new value for the tennis Years
    var tennisYears: Int{
        get{
            if let thisUser = changingUser as? User{
                
                if let theTennisYears = thisUser.tennisYears{
                    return Int(theTennisYears)
                }
            }
            return 0
        }
        set{
           if let thisUser = changingUser as? User{
            
            thisUser.setValue(newValue, forKey: "tennisYears")
                
            }
        }
    }
    
    //variable for basketball Years. Get returns an integer of the basketball years: as it is in NSNumber form. Also will set the new value for the basketball Years
    var basketballYears: Int{
        get{
            if let thisUser = changingUser as? User{
                
                if let theBasketballYears = thisUser.basketballYears{
                    return Int(theBasketballYears)
                }
            }
            return 0
        }
        
        set{
            if let thisUser = changingUser as? User{
                
                thisUser.setValue(newValue, forKey: "basketballYears")
                
            }
        }
    }
    
    //variable for baseball Years. Get returns an integer of the basketball years: as it is in NSNumber form. Also will set the new value for the baseball Years
    var baseballYears: Int{
        get{
            if let thisUser = changingUser as? User{
                
                if let theBaseballYears = thisUser.baseballYears{
                    return Int(theBaseballYears)
                }
            }
            return 0
        }
        set{
            if let thisUser = changingUser as? User{
                
                thisUser.setValue(newValue, forKey: "baseballYears")
                
            }
        }
    }
    
        //variable for tennis Years. Get returns an integer of the tennis years: as it is in NSNumber form. Also will set the new value for the tennis Years
    var tennisSkill: Int{
        get{
            if let thisUser = changingUser as? User{
                
                if let theTennisSkill = thisUser.tennisSkill{
                    return Int(theTennisSkill)
                }
            }
            return 0
        }
        set{
            if let thisUser = changingUser as? User{
                
                thisUser.setValue(newValue, forKey: "tennisSkill")
                
            }
        }
    }
    
        //variable for basketball Skill. Get returns an integer of the basketball years: as it is in NSNumber form. Also will set the new value for the basketball Skill
    var basketballSkill: Int{
        get{
            if let thisUser = changingUser as? User{
                
                if let theBasketballSkill = thisUser.basketballSkill{
                    return Int(theBasketballSkill)
                }
            }
            return 0
        }
        set{
            if let thisUser = changingUser as? User{
                
                thisUser.setValue(newValue, forKey: "basketballSkill")
                
            }
        }
    }
    
        //variable for baseball Skill. Get returns an integer of the baseball Skill: as it is in NSNumber form. Also will set the new value for the baseball Skill
    var baseballSkill: Int{
        get{
            if let thisUser = changingUser as? User{
                
                if let theBaseballSkill = thisUser.baseballSkill{
                    print("This is the baseball Skill")
                    print(theBaseballSkill)
                    return Int(theBaseballSkill)
                }
            }
            return 0
        }
        set{
            if let thisUser = changingUser as? User{
                
                thisUser.setValue(newValue, forKey: "baseballSkill")
                
            }
        }
    }
    
    

    
    
    
    
    
    

}