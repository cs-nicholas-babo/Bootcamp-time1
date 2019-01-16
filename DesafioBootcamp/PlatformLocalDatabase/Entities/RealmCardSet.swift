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
    
    @objc dynamic var code: String = ""
    @objc dynamic var name: String = ""
    
    override public static func primaryKey() -> String {
        return "code"
    }
    
}

extension RealmCardSet: DomainRepresentableType{
    typealias MTG_Entity = Domain.CardSet
    
    func baseData() -> CardSet {
        return CardSet(code: self.code, name: self.name)
    }
    
}

extension CardSet: RealmRepresentable{
    typealias RealmType = RealmCardSet
    
    func realmData() -> RealmCardSet {
        let realmObject = RealmCardSet()
        realmObject.code = self.code
        realmObject.name = name
        
        return realmObject
    }
}
