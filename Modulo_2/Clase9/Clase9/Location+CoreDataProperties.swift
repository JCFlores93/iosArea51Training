//
//  Location+CoreDataProperties.swift
//  Clase9
//
//  Created by Alumno on 11/22/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var place: Place?

}
