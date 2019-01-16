//
//  RealmCardType.swift
//  PlatformLocalDatabase
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import RealmSwift

final public class RealmCardType: RealmSwift.Object{
    
    @objc dynamic var name:String = ""
    
    override public static func primaryKey() -> String {
        return "name"
    }
    
}
