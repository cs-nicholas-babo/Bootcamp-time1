//
//  RealmCardSetSpec.swift
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

class RealmCardSetSpec: QuickSpec {
    
    override func spec() {
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
