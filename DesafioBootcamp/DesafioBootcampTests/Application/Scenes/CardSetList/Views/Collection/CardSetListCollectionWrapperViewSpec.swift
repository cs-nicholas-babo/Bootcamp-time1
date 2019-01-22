//
//  CardSetListCollectionWrapperViewSpec.swift
//  DesafioBootcampTests
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp


class CardSetListCollectionWrapperViewSpec: QuickSpec {
    override func spec() {
        describe("CardSetListCollectionWrapperView") {
            var sut: CardSetListCollectionWrapperView!
            
            context("when initialized") {
                beforeEach {
                    sut = CardSetListCollectionWrapperViewFactory.make()
                }
                
                context("and is fed with cards") {
                    beforeEach {
                        
                    }
                    
                    it("should feed its data source") {
                        
                    }
                }
                
            }
        }
    }
}
