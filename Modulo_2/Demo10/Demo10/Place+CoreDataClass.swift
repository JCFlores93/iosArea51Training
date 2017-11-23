//
//  Place+CoreDataClass.swift
//  Demo10
//
//  Created by Admin on 22/11/17.
//  Copyright © 2017 Area51. All rights reserved.
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
        let newPlace1 = Place(context: context)
        
        newPlace1.name = "Moscow"
        newPlace1.address = "Luzhniki Stadium"
        
        let location1 = Location(context: context)
        location1.latitude = Double(-12.101038)
        location1.longitude = Double(-77.018460)
        
        newPlace1.location = location1
        
        let newPlace2 = Place(context: context)
        
        newPlace2.name = "Saint Petersburg"
        newPlace2.address = "Saint Petersburg Stadium"
        
        let location2 = Location(context: context)
        location2.latitude = Double(-12.102779)
        location2.longitude = Double(-77.046870)
        
        newPlace2.location = location2
        
        let newPlace3 = Place(context: context)
        
        newPlace3.name = "Sochi"
        newPlace3.address = "Fisht Stadium"
        
        let location3 = Location(context: context)
        location3.latitude = Double(-12.110476)
        location3.longitude = Double(-77.014440)
        
        newPlace3.location = location3
        
        let newPlace4 = Place(context: context)
        
        newPlace4.name = "Ekaterinburg"
        newPlace4.address = "Ekaterinburg Arena"
        
        let location4 = Location(context: context)
        location4.latitude = Double(-12.128228)
        location4.longitude = Double(-77.027012)
        
        newPlace4.location = location4
        
        let newPlace5 = Place(context: context)
        
        newPlace5.name = "Rostov-on-Don"
        newPlace5.address = "Rostov Arena"
        
        let location5 = Location(context: context)
        location5.latitude = Double(-12.095125)
        location5.longitude = Double(-77.028449)
        
        newPlace5.location = location5
        
        places.append(newPlace1)
        places.append(newPlace2)
        places.append(newPlace3)
        places.append(newPlace4)
        places.append(newPlace5)
        
        return places
    
    }
}
