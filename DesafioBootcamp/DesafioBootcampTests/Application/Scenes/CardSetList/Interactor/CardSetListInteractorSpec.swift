//
//  CardSetListInteractorSpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class CardSetListInteractorSpec: QuickSpec {
    override func spec() {
        describe("CardSetListInteractor") {
            var sut: CardSetListInteractor!
            var presenter: CardSetListPresentationLogicMock!
            var cardGateway: MTGCardGatewayMock!
            
            context("when initialized") {
                
                beforeEach {
                    presenter = CardSetListPresentationLogicMock()
                    cardGateway = MTGCardGatewayMock()
                    
                }
                
                context("and succeed to fetch meta sets") {
                    
                    beforeEach {
                        cardGateway.shouldFail = false
                        sut = CardSetListInteractor(presenter: presenter, cardGateway: cardGateway)
                    }
                    
                    it("should send ready response to presenter") {
                        expect(presenter.isReadyToPresent).to(beTrue())
                    }
                }
                
                context("and fail to fetch meta sets") {
                    
                    beforeEach {
                        cardGateway.shouldFail = true
                        sut = CardSetListInteractor(presenter: presenter, cardGateway: cardGateway)
                    }
                    
                    it("should present an error") {
                        expect(presenter.didPresentError).to(beTrue())
                    }
                }
                
                context("fetch complete set of cards") {
                    
                    beforeEach {
                        sut = CardSetListInteractor(presenter: presenter, cardGateway: cardGateway)
                    }
                    
                    // TODO: Fix test
                    it("should succeed to fetch cards") {
                        cardGateway.shouldFail = false
                        sut.fetchSet()
                        expect(cardGateway.didCallfetchSet).to(beTrue())
//                        expect(presenter.willPresentCards).to(beTrue())
                    }
                    
                    it("should fail to fetch cards") {
                        cardGateway.shouldFail = true
                        sut.fetchSet()
                        expect(presenter.didPresentError).to(beTrue())
                    }
                    
                }
                
            }
        }
    }
}
