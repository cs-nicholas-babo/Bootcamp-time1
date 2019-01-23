//
//  CardSetListInteractorSpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Domain

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
                    sut = CardSetListInteractor(presenter: presenter, cardGateway: cardGateway)
                }
                
                context("and succeed to fetch cards") {
                    beforeEach {
                        cardGateway.shouldFail = false
                        sut.fetchSet()
                    }
                    
                    it("should present cards") {
                        expect(presenter.didPresentCards).to(beTrue())
                    }
                    
                }
                
                context("and fail to fetch cards") {
                    
                    beforeEach {
                        cardGateway.shouldFail = true
                        sut.fetchSet()
                    }
                    
                    it("should present an error") {
                        expect(presenter.didPresentError).to(beTrue())
                    }
                    
                }
                
            }
        }
    }
}
