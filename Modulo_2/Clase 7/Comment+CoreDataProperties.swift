//
//  Comment+CoreDataProperties.swift
//  Clase 6
//
//  Created by Alumno on 11/15/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var message: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var post: Post?

}
