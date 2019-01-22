//
//  RealmCardType.swift
//  PlatformLocalDatabase
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import RealmSwift

final public class RealmCardType: RealmSwift.Object{
    
    @objc public dynamic var name: String = ""
    
    override public static func primaryKey() -> String {
        return "name"
    }
    
}

extension RealmCardType: DomainRepresentableType {
    typealias MTG_Entity = CardType
    
    public func baseData() -> CardType {
        return CardType(name: self.name)
    }
}

extension CardType: RealmRepresentable {
    typealias RealmType = RealmCardType
    
    public func realmData() -> RealmCardType {
        let realmObject = RealmCardType()
        realmObject.name = self.name
        
        return realmObject
    }

}
