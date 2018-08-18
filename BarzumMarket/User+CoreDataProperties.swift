//
//  User+CoreDataProperties.swift
//  BarzumMarket
//
//  Created by Nikolas Omelianov on 18.08.2018.
//  Copyright © 2018 Nikolas Omelianov. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String

}
