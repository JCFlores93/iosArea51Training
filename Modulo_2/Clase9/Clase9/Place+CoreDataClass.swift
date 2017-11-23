//
//  Place+CoreDataClass.swift
//  Clase9
//
//  Created by Alumno on 11/22/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Place)
public class Place: NSManagedObject {
    
    static func defaultData() -> [Place]? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let context = appDelegate.persistentContainer.viewContext
        
        var places = [Place]()
        
        //Place 1
        let newPlace1 = Place(context: context)
        newPlace1.name = "Moscow"
        newPlace1.address = "Luzhniki Stadium"
        let location1 = Location(context: context)
        location1.latitude = Double("-12.101038")!
        location1.longitude = Double("-77.018460")!
        newPlace1.location = location1
        places.append(newPlace1)
        
        //Place 2
        let newPlace2 = Place(context: context)
        newPlace2.name = "Saint Petersburg"
        newPlace2.address = "Saint Petersburg Stadium"
        let location2 = Location(context: context)
        location2.latitude = Double("-12.102779")!
        location2.longitude = Double("-77.046870")!
        newPlace2.location = location2
        places.append(newPlace2)
        
        return places
 
    }

}
