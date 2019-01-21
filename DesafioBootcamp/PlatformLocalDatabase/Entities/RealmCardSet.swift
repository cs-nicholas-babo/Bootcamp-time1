//
//  RealmCardSet.swift
//  PlatformLocalDatabase
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import RealmSwift
import Domain

public final class RealmCardSet: RealmSwift.Object{
    
    @objc public dynamic var code: String = ""
    @objc public dynamic var name: String = ""
    @objc public dynamic var releaseDate: Date = Date()
    
    override public static func primaryKey() -> String {
        return "code"
    }
    
}

extension RealmCardSet: DomainRepresentableType{
    typealias MTG_Entity = Domain.MetaCardSet
    
    func baseData() -> MetaCardSet {
        return MetaCardSet(code: self.code, name: self.name, releaseDate: self.releaseDate)
    }
    
}

extension MetaCardSet: RealmRepresentable{
    typealias RealmType = RealmCardSet
    
    func realmData() -> RealmCardSet {
        let realmObject = RealmCardSet()
        realmObject.code = self.code
        realmObject.name = name
        realmObject.releaseDate = releaseDate
        
        return realmObject
    }
}
