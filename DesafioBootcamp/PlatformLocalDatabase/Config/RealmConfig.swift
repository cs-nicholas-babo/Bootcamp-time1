//
//  RealmConfig.swift
//  PlatformLocalDatabase
//
//  Created by nicholas.r.babo on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

struct RealmConfig{
    
    static var production: Realm{
        return try! Realm()
    }
    
    static var test: Realm{
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "com.DesafioBootcamp.Debug.Realm.CacheManager"
        return try! Realm(configuration: config)
    }
    
}
