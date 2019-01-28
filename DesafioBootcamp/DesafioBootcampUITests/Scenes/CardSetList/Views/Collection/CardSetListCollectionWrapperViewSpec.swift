//
//  CardSetListCollectionWrapperViewSpec.swift
//  DesafioBootcampUITests
//
//  Created by ricardo.s.rachaus on 28/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioBootcamp

class CardSetListCollectionWrapperViewSpec: QuickSpec {
    
    override func spec() {
        describe("CardSetList WrapperView Spec") {
            
            var sut: CardSetListCollectionWrapperView!
            
            context("when initialized") {
                
                beforeEach {
                    sut = CardSetListCollectionWrapperView(frame: UIScreen.main.bounds)
                    sut.datasource.cards = [MockValue.typedCards]
                }
                
                it("should look like this") {
                    expect(sut) == snapshot()
                }
                
            }
            
        }
    }
    
}

