//
//  RealmCard.swift
//  PlatformLocalDatabaseTests
//
//  Created by g.guimaraes on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Realm
import RealmSwift

@testable import PlatformLocalDatabase
@testable import Domain

class RealmCardSpec: QuickSpec {
    
    override func spec() {
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
            
        }
    }
    
}
