//
//  Place+CoreDataProperties.swift
//  Demo10
//
//  Created by Admin on 22/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var location: Location?

}
