//
//  MTG_ModelSpec.swift
//  PlatformAPITests
//
//  Created by nicholas.r.babo on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Moya
import Alamofire

@testable import PlatformAPI

final class MTG_ModelSpec: QuickSpec{
    
    override func spec() {
        describe("When using a MTG_Service") {
            describe("with a mockup MTG_Model", {
                describe("the MetaSets model", {
                    let metaSetsMockup = MTG_Model.getMetaSets(page: 1)

                    it("should have the correct mockup data", closure: {
                        expect(metaSetsMockup.sampleData).to(equal(LocalData.localDataWith("sets_stub_1")))
                    })
                    
                    it("should return an empty json file when created with invalid parameters", closure: {
                        let invalidSet = MTG_Model.getMetaSets(page: 999)
                        expect(invalidSet.sampleData).to(equal(LocalData.emptySets))
                    })
                })
                describe("the Cards model", {
                    let cardsMockup = MTG_Model.getCards(set: "10E", page: 1)
                    it("should have the correct mockup data", closure: {
                        expect(cardsMockup.sampleData).to(equal(LocalData.localDataWith("cards_stub_10E_1")))
                    })
                })
                
            })
        }
    }
    
}

