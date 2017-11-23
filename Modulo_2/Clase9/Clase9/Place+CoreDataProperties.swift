//
//  Place+CoreDataProperties.swift
//  Clase9
//
//  Created by Alumno on 11/22/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
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
