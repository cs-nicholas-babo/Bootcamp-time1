//
//  CardSetListPresenterSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class CardSetListPresenterSpec: QuickSpec {
    
    override func spec() {
        describe("CardSetList Presenter") {
            
            var sut: CardSetListPresenter!
            
            context("initializing with view controller") {
                
                var vc: CardSetListDisplayLogicMock!
                
                beforeEach {
                    vc = CardSetListDisplayLogicMock()
                    sut = CardSetListPresenter(viewController: vc)
                }
                
                context("when presenting success") {
                    
                    beforeEach {
                        sut.present(response: .success([MockValues.cardSetMock]))
                    }
                    
                    // TODO: Fix test
//                    it("should display viewModel") {
//                        expect(vc.didDisplayViewModel).to(beTrue())
//                        expect(vc.viewModel).toNot(beNil())
//                    }
                    
                }
                
                context("when readyToDisplayCards") {
                    
                    beforeEach {
                        sut.present(response: .readyToPresentSets)
                    }
                    
                    it("should be readyToDisplayCards") {
                        expect(vc.isReadyToDisplayCards).to(beTrue())
                    }
                    
                }
                
                context("when displaying error") {
                    
                    beforeEach {
                        sut.present(response: .error)
                    }
                    
                    it("should display error") {
                        expect(vc.didDisplayError).to(beTrue())
                    }
                }
                
            }
            
        }
    }
    
}
