//
//  PlatformLocalDatabaseTests.swift
//  PlatformLocalDatabaseTests
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Realm
import RealmSwift

@testable import PlatformLocalDatabase
@testable import Domain

class FavoriteCardsRepositorySpec: QuickSpec {

    override func spec() {
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "com.DesafioBootcamp.Debug.Realm.FavoriteCardsRepository"
        let realm = try! Realm(configuration: config)
        
        let repo = FavoriteCardsRepository(realm: realm)
        beforeEach {
            repo.deleteAll()
        }
        
        describe("When using a clear FavoriteCardsRepository") {
            describe("a query for all objects", closure: {
                it("should return all stored objects", closure: {
                    let card1 = RealmCardMock.card1
                    let card2 = RealmCardMock.card2
                    let card3 = RealmCardMock.card3
                    
                    repo.upsert(object: card1.baseData())
                    repo.upsert(object: card2.baseData())
                    repo.upsert(object: card3.baseData())
                    
                    
                    let allObjects = repo.get()
                    expect(allObjects.count) == 3
                    
                })
            })
            
            describe("a realm object stored", closure: {
                it("should have the correct properties associated", closure: {
                    let card = RealmCardMock.card1
                    
                    repo.upsert(object: card.baseData())
                    
                    let storedCard = realm.objects(RealmCard.self).first
                    expect(storedCard?.id) == "uuid1"
                    expect(storedCard?.name) == "name1"
                    expect(storedCard?.setCode) == "code1"
                })
            })
            
            describe("the deleteAll function", closure: {
                it("should erase all records from the database", closure: {
                    let card1 = RealmCardMock.card1
                    let card2 = RealmCardMock.card2
                    let card3 = RealmCardMock.card3
                    
                    repo.upsert(object: card1.baseData())
                    repo.upsert(object: card2.baseData())
                    repo.upsert(object: card3.baseData())
                    
                    expect(repo.get().count) == 3
                    
                    repo.deleteAll()
                    
                    expect(repo.get().count) == 0
                })
            })
            
            describe("the delete function", closure: {
                it("should erase the specified record from the database", closure: {
                    let card1 = RealmCardMock.card1
                    let card2 = RealmCardMock.card2
                    
                    repo.upsert(object: card1.baseData())
                    repo.upsert(object: card2.baseData())
                    
                    expect(repo.get().count) == 2
                    
                    repo.delete(object: card1.baseData())
                    
                    expect(repo.get().count) == 1
                    expect(repo.get().first?.id) == "uuid2"
                })
            })
            
            describe("Favoriting a card", closure: {
                it("should store it in the database", closure: {
                    
                    let card = RealmCardMock.card1.baseData()
                    let service = FavoriteCardsService(repository: repo)
                    service.favorite(card: card, status: true)
                    
                    expect(repo.get().count) == 1
                    expect(repo.get().first?.id) == "uuid1"
                    
                })
            })
            
            describe("Unfavoriting a card", closure: {
                it("should remove the specified object from the database", closure: {
                    
                    let card = RealmCardMock.card1.baseData()
                    let service = FavoriteCardsService(repository: repo)
                    service.favorite(card: card, status: true)
                    
                    expect(repo.get().count) == 1
                    expect(repo.get().first?.id) == "uuid1"
                    
                    service.favorite(card: card, status: false)
                    
                    expect(repo.get().count) == 0
                })
            })
            
            describe("Fetching the favorited cards and their sets", {
                it("should return the correct fevorited sets", closure: {
                    
                    let card1 = RealmCardMock.card1
                    let card2 = RealmCardMock.card2
                    let card3 = RealmCardMock.card3
                    
                    card1.setCode = "code1"
                    card2.setCode = "code1"
                    card3.setCode = "code2"
                    
                    let set1 = RealmCardSetMock.set1
                    let set2 = RealmCardSetMock.set1
                    
                    set1.code = "code1"
                    set2.code = "code2"
                    
                    let service = FavoriteCardsService(repository: repo)
                    service.favorite(card: card1.baseData(), status: true)
                    service.favorite(card: card2.baseData(), status: true)
                    service.favorite(card: card3.baseData(), status: true)
                    
                    let cacheRepo = CardSetCacheRepository(realm: realm)
                    cacheRepo.upsert(object: set1.baseData())
                    cacheRepo.upsert(object: set2.baseData())
                    
                    expect(cacheRepo.get().count) == 2
                    expect(repo.get().count) == 3
                    
                    let favoritedSets = repo.fetchFavoriteCardSets()
                    
                    expect(favoritedSets.count) == 2
                })
            })
            
        }
        
    }

}
