//
//  RealmCard.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import RealmSwift
import Domain

public final class RealmCard: RealmSwift.Object {
    @objc public dynamic var id: String = ""
    @objc public dynamic var name: String = ""
    @objc public dynamic var setCode: String = ""
    let types: List<RealmCardType> = List<RealmCardType>()
    @objc public dynamic var imageURL: String?
    
    override public static func primaryKey() -> String {
        return "id"
    }
}

extension RealmCard: DomainRepresentableType {
    typealias MTG_Entity = Domain.Card
    
    func baseData() -> Card {
        return Card(id: self.id, name: self.name, setCode: self.setCode, types: Set<CardType>( self.types.map({ $0.baseData() }) ), imageURL: self.imageURL)
    }
}

extension Card: RealmRepresentable {
    typealias RealmType = RealmCard
    
    func realmData() -> RealmCard {
        let realmObject = RealmCard()
        realmObject.id = self.id
        realmObject.name = self.name
        realmObject.setCode = self.setCode
        self.types.forEach({ realmObject.types.append($0.realmData()) })
        realmObject.imageURL = self.imageURL
        
        return realmObject
    }
    
    
}
