//
//  CardSetListViewModelSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Domain

@testable import DesafioBootcamp

class CardSetListViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("CardSetList View Model") {
            
            var sut: CardSetList.ViewModel!
            
            context("creating View Model with CardSet") {
                
                beforeEach {
                    sut = CardSetList.ViewModel(cardSet: MockValues.cardSet)
                }
                
                it("should have non-empty card set") {
                    expect(sut.typedCards.isEmpty).to(beFalse())
                }
                
                it("should match key type and Card Type") {
                    let types = MockValues.cardSet.cards.flatMap { $0.types }
                    let typesSet = Set<CardType>(types)
                    expect(sut.typedCards.count).to(equal(typesSet.count))
                }
                
            }
            
        }
    }
    
}
