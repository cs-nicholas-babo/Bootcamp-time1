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
    
    public init(realm: Realm){
        self.realm = realm
    }
    
    func get() -> [Card] {
        return realm.objects(RealmCard.self).map({ $0.baseData() })
    }
    
    public func upsert(object: Card) {
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
    
    func deleteAll(){
        let all = realm.objects(RealmCard.self)
        try! realm.write {
            realm.delete(all)
        }
    }
    
    func fetchFavoriteCardSets(query: String?, from metaSets: [MetaCardSet]) -> [CardSet]{
        var allCards = self.get()
        
        if let query = query {
            allCards = allCards.filter{ $0.name.contains(query)}
        }
        
        var finalSets: [CardSet] = []
        
        metaSets.forEach { (metaSet) in
            var setCards:[Card] = []
            allCards.forEach({ (card) in
                if card.setCode == metaSet.code{
                    setCards.append(card)
                }
            })
            if setCards.count > 0{
                let cardSet = CardSet(set: metaSet, cards: setCards)
                finalSets.append(cardSet)
            }
        }
        return finalSets
    }

}
