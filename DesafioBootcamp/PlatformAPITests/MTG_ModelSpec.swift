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
        let provider = MoyaProvider<MTG_Model>.init(stubClosure: MoyaProvider<MTG_Model>.immediatelyStub)
        let mockupService = MTG_Service(provider: provider, decoder: JSONDecoder.standardDecoder)
        
        describe("When using a MTG_Service") {
            describe("with a mockup MTG_Model", {
                describe("the MetaSets model", {
                    let metaSetsMockup = MTG_Model.getMetaSets(page: 1)

                    it("should have the correct mockup data", closure: {
                        let fileURL = Bundle(for: MTG_Service.self).url(forResource: "sets_stub_1", withExtension: "json") ?? URL(fileURLWithPath: "")
                        let data = try? Data(contentsOf: fileURL)
                        expect(metaSetsMockup.sampleData).to(equal(data))
                    })
                })
                describe("the Cards model", {
                    let cardsMockup = MTG_Model.getCards(set: "10E", page: 1)
                    it("should have the correct mockup data", closure: {
                        let fileURL = Bundle(for: MTG_Service.self).url(forResource: "cards_stub_10E_1", withExtension: "json") ?? URL(fileURLWithPath: "")
                        let data = try? Data(contentsOf: fileURL)
                        expect(cardsMockup.sampleData).to(equal(data))
                    })
                })
                
            })
        }
    }
    
}

