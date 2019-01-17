//
//  CacheRepository.swift
//  PlatformLocalDatabase
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import RealmSwift
import Domain

public final class CacheManager{
    
    let cardSetRepository: CardSetCacheRepository
    
    init (realm:Realm){
        self.cardSetRepository = CardSetCacheRepository(realm: realm)
    }
    
}

final class CardSetCacheRepository: RealmRepository{
    typealias T = CardSet
    
    let realm: Realm
    
    init(realm: Realm){
        self.realm = realm
    }
    
    func get() -> [CardSet] {
        return realm.objects(RealmCardSet.self).map({ $0.baseData()})
    }
    
    func upsert(object: CardSet) {
        let realmObject = object.realmData()
        
        try! realm.write {
            realm.add(realmObject, update: true)
        }
    }
    
    func delete(object: CardSet) {
        let realmObject = realm.object(ofType: RealmCardSet.self, forPrimaryKey: object.code)
        
        if let realmObject = realmObject{
            try! realm.write {
                realm.delete(realmObject)
            }
        }
    }
    
    func deleteAll(){
        let all = realm.objects(RealmCardSet.self)
        try! realm.write {
            realm.delete(all)
        }
    }
}
