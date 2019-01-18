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

import Moya
import Alamofire

class PlatformAPITests: QuickSpec {
    
    override func spec() {
        let service = MTG_Service()
        let provider = MoyaProvider<MTG_Model>.init(stubClosure: MoyaProvider<MTG_Model>.immediatelyStub)
        let mockupService = MTG_Service(provider: provider, decoder: JSONDecoder.standardDecoder)

        
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
                
                describe("using a query", {
                    it("should return the cards containing the query in its name", closure: {
                        waitUntil(action: { done in
                            mockupService.fetchCards(filter: "Elf", handler: { (result) in
                                switch result{
                                case .success(let cards):
                                    expect(cards.count).to(equal(78))
                                    done()
                                case .failure(_):
                                    fail()
                                    done()
                                }
                            })
                        })
                    })
                    it("should return the correct results", closure: {
                        waitUntil(action: { done in
                            mockupService.fetchCards(filter: "Elf", handler: { (result) in
                                switch result{
                                case .success(let cards):
                                    cards.forEach({ (card) in
                                        expect(card.name.lowercased()).to(contain("Elf".lowercased()))
                                    })
                                    done()
                                case .failure(_):
                                    fail()
                                    done()
                                }
                            })
                        })
                    })
                })
                
                describe("using a not-valid query", {
                    it("should not be successful", closure: {
                        waitUntil(action: { done in
                            mockupService.fetchCards(filter: "asbvcadsfjklh", handler: { (result) in
                                switch result{
                                case .success(_):
                                    fail()
                                    done()
                                case .failure(let error):
                                    expect(error).toNot(beNil())
                                    done()
                                }
                            })
                        })
                    })
                    
                    it("should return a _ error", closure: {
                        waitUntil(action: { done in
                            service.fetchCards(filter: "asbvcadsfjklh", handler: { (result) in
                                switch result{
                                case .success(_):
                                    fail()
                                    done()
                                case .failure(let error):
                                    expect(error.errorCode).to(equal(NetworkErrorCode.decodingError.rawValue))
                                    done()
                                }
                            })
                        })
                    })
                })
            })
        }
        describe("When using a Mockup API service") {
            describe("a fetch for card sets", {
                it("should return a valid response of Sets", closure: {
                    waitUntil(action: { done in
                        mockupService.fetchSets(handler: { (result) in
                            switch result{
                            case .success(let metaSets):
                                expect(metaSets).toNot(beNil())
                                done()
                            case .failure(_):
                                fail()
                                done()
                            }
                        })
                    })
                })
                
                it("should return the expected amount of sets", closure: {
                    waitUntil(action: { done in
                        mockupService.fetchSets(handler: { (result) in
                            switch result{
                            case .success(let metaSets):
                                expect(metaSets.count).to(equal(431))
                                done()
                            case .failure(_):
                                fail()
                                done()
                            }
                        })
                    })
                })
                
                it("should return the expected sets", closure: {
                    waitUntil(action: { done in
                        mockupService.fetchSets(handler: { (result) in
                            switch result{
                            case .success(let metaSets):
                                expect(metaSets.first?.code).to(equal("10E"))
                                done()
                            case .failure(_):
                                fail()
                                done()
                            }
                        })
                    })
                })
            })
            
        }
    }
    
}
