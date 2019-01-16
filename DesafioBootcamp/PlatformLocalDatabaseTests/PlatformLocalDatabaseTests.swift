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

class PlatformLocalDatabaseTests: QuickSpec {

    override func spec() {
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "com.DesafioBootcamp.Debug.Realm.FavoriteCardsRepository"
        let realm = try! Realm(configuration: config)
        
        let repo = FavoriteCardsRepository(realm: realm)
        beforeSuite {
            repo.deleteAll()
        }
        
        describe("When using RealmCard") {
            
            describe("a RealmCard instatiated from a Card", closure: {
                it("should have the expected properties", closure: {
                    let card = Card(id: "uuid", name: "name", setCode: "code", types: Set<CardType>())
                    let realmCard = card.realmData()
                    
                    expect(realmCard.id) == "uuid"
                    expect(realmCard.name) == "name"
                    expect(realmCard.setCode) == "code"
                })
            })
            
            describe("a Card instatianted from a RealmCard", closure: {
                it("should have the expected properties", closure: {
                    let realmCard = RealmCardMock.card1
                    let card = realmCard.baseData()
                    
                    expect(card.id) == "uuid1"
                    expect(card.name) == "name1"
                    expect(card.setCode) == "code1"
                })
            })
            
            describe("a query for all objects", closure: {
                it("shoudl return all stored objects", closure: {
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
            
            
        }
        
        describe("When using the FavoriteCardsService") {
            
            beforeEach {
                repo.deleteAll()
            }
            
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
        }
        
        
        describe("When using RealmCardSet") {
            describe("a RealmSet instatiated from a CardSet", closure: {
                it("should have the expected properties", closure: {
                    
                    let cardSet = CardSet(code: "code1", name: "name1")
                    let realmSet = cardSet.realmData()
                    
                    expect(realmSet.code) == cardSet.code
                    expect(realmSet.name) == cardSet.name
                })
            })
            
            describe("a CardSet instatianted from a RealmSet", closure: {
                it("should have the expected properties", closure: {
                    
                    let realmSet = RealmCardSetMock.set1
                    let cardSet = realmSet.baseData()
                    
                    expect(cardSet.name) == realmSet.name
                    expect(cardSet.code) == realmSet.code
                })
            })
        }
        
    }

}
