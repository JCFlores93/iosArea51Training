//
//  Plato.swift
//  C24_1112_M03_C6
//
//  Created by Alumno on 12/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import Foundation
import UIKit

class Plato {
    
    var uid: Int8 = 0
    let name: String?
    let content: String?
    let picture: UIImage?
    let createdAt: Date?
    let updatedAt: Date?
    
    //Como Picture y los Date son Null se pide Init
    private init(uid: Int8, name: String?, content: String?, picture: UIImage?) {
        self.uid = uid
        self.name = name
        self.content = content
        self.picture = picture
        self.createdAt = Date()
        self.updatedAt = nil
    }
 
    convenience init(name: String?, content: String?, picture: UIImage?){
        self.init(uid: 0, name: name, content: content, picture: picture)
    }
 
    convenience init(type: PlatoType) {
        if type == .menu {
            self.init(uid: 0, name: "", content: "", picture: nil)
        }
        else if type == .carta {
            self.init(uid: 0, name: "", content: "", picture: nil)
        }
        else {
            self.init(uid: 0, name: "", content: "", picture: nil)
        }
    }
    
}
