//
//  PlatformAPITests.swift
//  PlatformAPITests
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import XCTest
import Domain
import PlatformAPI
import Quick
import Nimble

class PlatformAPITests: QuickSpec {
    
    override func spec() {
        let service = MTG_Service()
        
        describe("Whe using API Services") {
            describe("When fetching cards", {
                describe("passing the set and the page as parameters", {
                    it("should return a not nil JSON response", closure: {
                        let set = MetaCardSet(code: "10E", name: "10E", releaseDate: Date())
                        waitUntil(timeout: 10.0) { done in
                            service.fetchCards(from: set, handler: { (result) in
                                expect(result).toNot(beNil())
                                done()
                            })
                        }
                    })
                    
                    it("should return the correct amount of items", closure: {
                        let set = MetaCardSet(code: "10E", name: "10E", releaseDate: Date())
                        waitUntil(timeout: 10.0) { done in
                            service.fetchCards(from: set, handler: { (result: Domain.Result<[Card]>) in
                                switch result{
                                case .success(let cards):
                                    expect(cards.count) == 100
                                    done()
                                default:
                                    done()
                                    break
                                }
                                
                            })
                        }
                    })
                })
            })
        }
        
    }
    
}
