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
            
            context("when initialized") {
                
                var vc: CardSetListDisplayLogicMock!
                
                beforeEach {
                    vc = CardSetListDisplayLogicMock()
                    sut = CardSetListPresenter(viewController: vc)
                }
                
                context("and present cards") {
                    
                    beforeEach {
                        sut.present(response: .success(MockValues.cardSetArray))
                    }
                    
//                     TODO: Fix test
                    it("should display viewModel") {
                        expect(vc.didDisplayViewModel).to(beTrue())
                        expect(vc.receivedViewModels).toNot(beNil())
                    }
                    
                }
                
                context("and ready to display cards") {
                    
                    beforeEach {
                        sut.present(response: .readyToPresentSets)
                    }
                    
                    it("should be readyToDisplayCards") {
                        expect(vc.isReadyToDisplayCards).to(beTrue())
                    }
                    
                }
                
                context("and present error") {
                    
                    beforeEach {
                        sut.present(response: .error)
                    }
                    
                    it("should display error") {
                        expect(vc.didDisplayError).to(beTrue())
                    }
                }
                
                context("and present no results") {
                    beforeEach {
                        sut.present(response: .success([]))
                    }
                    
                    it ("should display no results") {
                        expect(vc.didDisplayNoResults).to(beTrue())
                    }
                }
                
                context("and present search results") {
                    beforeEach {
                        sut.present(response: CardSetList.Response.searchResults(MockValues.cardSetArray))
                    }
                    
                    it("should display search results") {
                        expect(vc.didDisplaySearchResults).to(beTrue())
                    }
                }
                
            }
            
        }
    }
    
}
