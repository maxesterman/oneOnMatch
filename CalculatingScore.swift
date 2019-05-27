//
//  CalculatingScore.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/27/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import Foundation
import CoreData

class calculatingScore{
    
    var user: NSManagedObject?
    
    var ourscoreDictionary: Dictionary<User, Double> = [ : ]
    
    //calculating the score
    func calculatingScore(userToUse: NSManagedObject?, userToCompare: NSManagedObject?) -> Double? {
        if let ourUser = userToUse as? User{
            
            //takes the user's attributes into variables
            let otennisYears = ourUser.tennisYears ?? 0
            let otennisSkill = ourUser.tennisSkill ?? 0
            let obaseballYears = ourUser.baseballYears ?? 0
            let obaseballSkill = ourUser.baseballSkill ?? 0
            let obasketballYears = ourUser.basketballYears ?? 0
            let obasketballSkill = ourUser.baseballSkill ?? 0
            
            //turns the user's attributes into integers
            let ourtennisYears=Int(otennisYears)
            let ourtennisSkill=Int(otennisSkill)
            let ourbaseballYears=Int(obaseballYears)
            let ourbaseballSkill=Int(obaseballSkill)
            let ourbasketballYears=Int(obasketballYears)
            let ourbasketballSkill=Int(obasketballSkill)
            
            if let compareUser = userToCompare as? User{
                //takes the comparing user attributes into variables
                let ctennisYears = compareUser.tennisYears ?? 0
                let ctennisSkill = compareUser.tennisSkill ?? 0
                let cbaseballYears = compareUser.baseballYears ?? 0
                let cbaseballSkill = compareUser.baseballSkill ?? 0
                let cbasketballYears = compareUser.basketballYears ?? 0
                let cbasketballSkill = compareUser.baseballSkill ?? 0
                
                //takes the comparing users variables and turns them into integers
                let comparetennisYears=Int(ctennisYears)
                let comparetennisSkill=Int(ctennisSkill)
                let comparebaseballYears=Int(cbaseballYears)
                let comparebaseballSkill=Int(cbaseballSkill)
                let comparebasketballYears=Int(cbasketballYears)
                let comparebasketballSkill=Int(cbasketballSkill)
                
                //turns the difference into a double
                let differenceTennisYears=Double(abs(ourtennisYears-comparetennisYears))
                let differenceTennisSkill=Double(abs(ourtennisSkill-comparetennisSkill))
                let differenceBaseballYears=Double(abs(ourbaseballYears-comparebaseballYears))
                let differenceBaseballSkill=Double(abs(ourbaseballSkill-comparebaseballSkill))
                let differenceBasketballYears=Double(abs(ourbasketballYears-comparebasketballYears))
                let differenceBasketballSkill=Double(abs(ourbasketballSkill-comparebasketballSkill))


                //calculates the score
                let theScore = 1-(0.1*differenceTennisSkill+0.1*differenceBaseballSkill+0.1*differenceBasketballSkill+0.05*differenceTennisYears+0.05*differenceBaseballYears+0.05*differenceBasketballYears)
                
                
                //puts it in a dictionary
                ourscoreDictionary[compareUser]=theScore
                
                //returns a double of the score
                return theScore
                
            }
            
            
        }
        return nil
    }
    
    
}