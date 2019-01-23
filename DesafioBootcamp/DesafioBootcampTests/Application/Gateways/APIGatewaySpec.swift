//
//  APIGatewaySpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Domain

@testable import DesafioBootcamp

final class APIGatewaySpec: QuickSpec {
    override func spec() {
        describe("APIGatewaySpec") {
            var sut: APIGateway!
            
            context("when initialized") {
                var cardFetchService: CardFetchUseCaseMock!
                
                beforeEach {
                    cardFetchService = CardFetchUseCaseMock()
                    sut = APIGateway(service: cardFetchService)
                }
                
                context("and succeed to fetch sets") {
                    var receivedCardSets: [CardSet]!
                    
                    beforeEach {
                        cardFetchService.shouldFail = false
                        
                        sut.fetchSets { result in
                            switch result {
                            case .success(let cardSets):
                                receivedCardSets = cardSets
                            case .failure:
                                fail()
                            }
                        }
                    }
                    
                    it("should get card serts correctly") {
                        expect(receivedCardSets.flatMap { $0.cards }).to(contain(cardFetchService.sentCards))
                    }
                }
                
                context("and fail to fetch sets") {
                    beforeEach {
                        cardFetchService.shouldFail = true
                    }
                    
                    it("should result an error") {
                        sut.fetchSets { result in
                            switch result {
                            case .success:
                                fail()
                            case .failure:
                                expect({return .succeeded}).to(succeed())
                            }
                        }
                    }
                }
            }
        }
    }
}
