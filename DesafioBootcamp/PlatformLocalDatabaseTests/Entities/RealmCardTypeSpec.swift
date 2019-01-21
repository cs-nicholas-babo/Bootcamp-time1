//
//  RealmCardTypeSpec.swift
//  PlatformLocalDatabaseTests
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PlatformLocalDatabase
@testable import Domain

final class RealmCardTypeSpec: QuickSpec{
    
    override func spec() {
        
        describe("When using RealmCardType") {
            describe("a CardType converted from a RealmCardType", {
                it("should have the correct values", closure: {
                    let realmCardType = RealmCardType()
                    realmCardType.name = "Type1"
                    
                    let cardType = realmCardType.baseData()
                    expect(cardType.name).to(equal("Type1"))
                })
            })
            describe("a RealmCardType converted from a CardType", {
                it("should have the correct values", closure: {
                    let cardType = CardType(name: "Type2")
                    
                    let realmCardType = cardType.realmData()
                    expect(realmCardType.name).to(equal("Type2"))
                })
            })
        }
        
    }
    
}
