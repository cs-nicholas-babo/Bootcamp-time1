//
//  RealmCardSetMock.swift
//  Mockups
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import PlatformLocalDatabase

struct RealmCardSetMock{
    
    static var emptySet: RealmCardSet{
        return RealmCardSet()
    }
    
    static var set1: RealmCardSet{
        let set = RealmCardSet()
        set.name = "name1"
        set.code = "code1"
        return set
    }
}
