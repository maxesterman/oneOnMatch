//
//  User+CoreDataProperties.swift
//  oneOnMatch
//
//  Created by Max Sterman on 11/28/16.
//  Copyright © 2016 Max Sterman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var baseballSkill: NSNumber?
    @NSManaged var baseballYears: NSNumber?
    @NSManaged var basketballSkill: NSNumber?
    @NSManaged var basketballYears: NSNumber?
    @NSManaged var haveWeBegun: NSNumber?
    @NSManaged var password: String?
    @NSManaged var tennisSkill: NSNumber?
    @NSManaged var tennisYears: NSNumber?
    @NSManaged var username: String?

}
