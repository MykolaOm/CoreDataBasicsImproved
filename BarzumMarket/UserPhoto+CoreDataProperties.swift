//
//  UserPhoto+CoreDataProperties.swift
//  BarzumMarket
//
//  Created by Nikolas Omelianov on 18.08.2018.
//  Copyright © 2018 Nikolas Omelianov. All rights reserved.
//
//

import Foundation
import CoreData


extension UserPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPhoto> {
        return NSFetchRequest<UserPhoto>(entityName: "UserPhoto")
    }

    @NSManaged public var image: NSData

}
