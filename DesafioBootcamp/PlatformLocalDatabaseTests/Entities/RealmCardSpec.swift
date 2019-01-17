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
                    let type1 = CardType(name: "Type1")
                    let card = Card(id: "uuid", name: "name", setCode: "code", types: [type1], imageURL: "")
                    let realmCard = card.realmData()
                    
                    expect(realmCard.id) == "uuid"
                    expect(realmCard.name) == "name"
                    expect(realmCard.setCode) == "code"
                    expect(realmCard.types.first?.name) == "Type1"
                })
            })
            
            describe("a Card instatianted from a RealmCard", closure: {
                it("should have the expected properties", closure: {
                    let realmCard = RealmCardMock.card1
                    let realmCardType = RealmCardType()
                    realmCardType.name = "Type1"
                    realmCard.types.append(realmCardType)
                    let card = realmCard.baseData()
                    
                    expect(card.id) == "uuid1"
                    expect(card.name) == "name1"
                    expect(card.setCode) == "code1"
                    expect(card.types.first?.name) == "Type1"
                })
            })
            
        }
    }
    
}
