//
//  User.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/21/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//

import Foundation

public class UserBase: NSObject{
    public var baseballSkill: Int
    public var basketballSkill: Int
    public var tennisSkill: Int
    public var baseballYears: Int
    public var basketballYears: Int
    public var tennisYears: Int
    public var userName: String
    public var password: String
    public var beenHereBefore: Bool
    public var phoneNumber: Int
    
    
    
    override init() {
        /*self.baseballSkill=traits.charachteristics["Baseball Skill"]!
        self.basketballSkill=traits.charachteristics["Basketball Skill"]!
        self.tennisSkill=traits.charachteristics["Tennis Skill"]!
        self.baseballYears=traits.charachteristics["Baseball Years"]!
        self.basketballYears=traits.charachteristics["Basketball Years"]!
        self.tennisYears=traits.charachteristics["Tennis Years"]!
    */
        self.baseballSkill=0
        self.basketballSkill=0
        self.tennisSkill=0
        self.baseballYears=0
        self.basketballYears=0
        self.tennisYears=0
        self.userName=""
        self.password=""
        self.beenHereBefore=false
        self.phoneNumber=0000000000
        
    }
    

    //var numbers: PropertyList[
        
        
   
    
   // ]
    
    
}