//
//  FavoriteCardsRepository.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import RealmSwift

public final class FavoriteCardsRepository: RealmRepository {
    typealias T = Card
    let realm: Realm
    
    init(realm: Realm){
        self.realm = realm
    }
    
    func get() -> [Card] {
        return realm.objects(RealmCard.self).map({ $0.baseData() })
    }
    
    func upsert(object: Card) {
        let realmObject = object.realmData()
        
        try! realm.write {
            realm.add(realmObject, update: true)
        }
    }
    
    func delete(object: Card) {
        let realmObject = realm.object(ofType: RealmCard.self, forPrimaryKey: object.id)
        
        if let uRealmObject = realmObject {
            try! realm.write {
                realm.delete(uRealmObject)
            }
        }
    }

}
