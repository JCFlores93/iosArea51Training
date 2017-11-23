//
//  Location+CoreDataProperties.swift
//  Demo10
//
//  Created by Admin on 22/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var place: Place?

}
