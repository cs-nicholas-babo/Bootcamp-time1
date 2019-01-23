//
//  LocalDatabaseGatewaySpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Domain

@testable import DesafioBootcamp

final class LocalDatabaseGatewaySpec: QuickSpec {
    override func spec() {
        describe("LocalDatabaseGatewaySpec") {
            var sut: LocalDatabaseGateway!
            
            context("when initialized") {
                var favoriteCardsService: FavoriteCardsUseCaseMock!
                
                beforeEach {
                    favoriteCardsService = FavoriteCardsUseCaseMock()
                    
                    sut = LocalDatabaseGateway(favoritesService: favoriteCardsService)
                }
            
                context("and succeed to fetch sets") {
                    var receivedCardSets: [CardSet]!
                    
                    beforeEach {
                        favoriteCardsService.shouldFail = false
                        
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
                        expect(receivedCardSets == favoriteCardsService.sentCardSets)
                    }
                }
                
                context("and fail to fetch sets") {
                    beforeEach {
                        favoriteCardsService.shouldFail = true
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
