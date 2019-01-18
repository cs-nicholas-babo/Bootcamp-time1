//
//  ErrorSpec.swift
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
import Domain

@testable import PlatformAPI

final class ErrorSpec: QuickSpec{
    
    override func spec() {
        let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
            done(.failure(MoyaError.underlying(NSError(domain: "forcedError", code: 999, userInfo: nil), nil)))
        }
        let errorProvider = MoyaProvider<MTG_Model>(requestClosure: requestClosure)
        let errorService = MTG_Service(provider: errorProvider, decoder: JSONDecoder.standardDecoder)
        
        describe("After an error ocorred") {
            describe("When fetching cards", {
                describe("from a set", {
                    let set = MetaCardSet(code: "code1", name: "name1", releaseDate: Date())
                    it("should return an error", closure: {
                        waitUntil(action: { done in
                            errorService.fetchCards(from: set, handler: { (result) in
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
                })
            })
            
            describe("with a query", {
                it("should return an error", closure: {
                    waitUntil(action: { done in
                        errorService.fetchCards(filter: "erro", handler: { (result) in
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
            })
        }
    }
    
}
