//
//  FavoriteCardsServiceSpec.swift
//  PlatformLocalDatabaseTests
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Realm
import RealmSwift

@testable import PlatformLocalDatabase
@testable import Domain

final public class FavoriteCardsServiceSpec: QuickSpec{
    
    public override func spec() {
        let realm = RealmConfig.test
        let repo = FavoriteCardsRepository(realm: realm)
        let manager = CacheManager(realm: realm)
        
        beforeEach {
            repo.deleteAll()
            manager.cardSetRepository.deleteAll()
        }
        
        describe("When using the FavoriteCardService") {
            describe("fetching the favorited cards", {
                it("should return the correct amount of stored sets and cards", closure: {
                    let service = FavoriteCardsService(repository: repo, manager: manager)
                    let card1 = RealmCardMock.card1.baseData()
                    let card2 = RealmCardMock.card2.baseData()
                    
                    let set1 = RealmCardSetMock.set1.baseData()
                    let set2 = RealmCardSetMock.set2.baseData()
                    
                    manager.cardSetRepository.upsert(object: set1)
                    manager.cardSetRepository.upsert(object: set2)
                    
                    service.favorite(card: card1, status: true)
                    service.favorite(card: card2, status: true)
                    
                    expect(repo.get().count) == 2
                    
                    waitUntil(action: { done in
                        service.fetchFavoriteCards(handler: { (result) in
                            switch result{
                            case .success(let cards):
                                expect(cards.count).to(equal(2))
                                done()
                            case .failure(_):
                                done()
                                break
                            }
                        })
                    })
                })
                it("should return the correct stored cards", closure: {
                    let service = FavoriteCardsService(repository: repo, manager: manager)
                    let card1 = RealmCardMock.card1.baseData()
                    let set1 = RealmCardSetMock.set1.baseData()
                    manager.cardSetRepository.upsert(object: set1)
                    service.favorite(card: card1, status: true)
                    
                    waitUntil(action: { done in
                        service.fetchFavoriteCards(handler: { (result) in
                            switch result{
                            case .success(let cards):
                                expect(cards.count).to(equal(1))
                                expect(cards.first?.cards.first?.name).to(equal("name1"))
                                done()
                            case .failure(_):
                                done()
                                break
                            }
                        })
                    })
                })
            })
            describe("fetching cards with a not nil query", {
                it("should return the cards that contains the query in their names", closure: {
                    let service = FavoriteCardsService(repository: repo, manager: manager)
                    let card1 = RealmCardMock.card1.baseData()
                    let card2 = RealmCardMock.card2.baseData()
                    
                    let set1 = RealmCardSetMock.set1.baseData()
                    let set2 = RealmCardSetMock.set2.baseData()
                    
                    manager.cardSetRepository.upsert(object: set1)
                    manager.cardSetRepository.upsert(object: set2)
                    
                    service.favorite(card: card1, status: true)
                    service.favorite(card: card2, status: true)
                    
                    expect(repo.get().count) == 2
                    
                    waitUntil(action: { done in
                        service.fetchFavoriteCards(query: "name1", handler: { result in
                            switch result{
                            case .success(let cards):
                                expect(cards.count).to(equal(1))
                                expect(cards.first?.cards.first?.name).to(equal("name1"))
                                done()
                            case .failure(_):
                                done()
                                break
                            }
                        })
                    })
                })
            })
        }
        
        describe("When using the FavoriteCardsServiceProvider") {
            describe("An instantiated Service Provider", {
                let service = FavoriteCardsServiceProvider()
                it("should have be a valid instance", closure: {
                    expect(service).toNot(beNil())
                })
                
                it("should return a valid service", closure: {
                    expect(service.useCase()).toNot(beNil())
                })
            })
        }
        
    }
}
