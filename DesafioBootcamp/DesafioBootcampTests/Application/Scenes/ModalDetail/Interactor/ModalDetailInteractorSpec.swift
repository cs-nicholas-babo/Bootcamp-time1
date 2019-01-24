//
//  ModalDetailInteractorSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp
@testable import PlatformLocalDatabase

class ModalDetailInteractorSpec: QuickSpec {
    
    override func spec() {
        describe("ModalDetail Interactor") {
            
            var sut: ModalDetailInteractor!
            
            context("when initialized") {
                
                var presenter: ModalDetailPresenterMock!
                var provider: TestFavoriteCardsServiceProvider!
                
                beforeEach {
                    presenter = ModalDetailPresenterMock()
                    provider = TestFavoriteCardsServiceProvider()
                    sut = ModalDetailInteractor(presenter: presenter, useCase: provider.useCase(), subset: MockValues.subsetMock)
                }
                
                context("show card") {
                    
                    it("should show card and not favorite") {
                        sut.show()
                        expect(presenter.toShowCard).to(beTrue())
                        expect(presenter.status).to(beFalse())
                    }
                }
                
                context("favorite card") {
                    
                    it("should toggle favorite card") {
                        sut.toggleFavorite()
                        expect(presenter.toRefreshButton).to(beTrue())
                        expect(presenter.status).to(beTrue())
                    }
                    
                    it("should untoggle favorite card") {
                        sut.toggleFavorite()
                        sut.toggleFavorite()
                        expect(presenter.toRefreshButton).to(beTrue())
                        expect(presenter.status).to(beFalse())
                    }
                    
                }
                
                context("change current card index") {
                    
                    it("should have changed index and refresh button") {
                        sut.changeIndex(row: MockValues.selectedIndexMock)
                        expect(presenter.toRefreshButton).to(beTrue())
                        expect(presenter.selectedIndex).to(equal(MockValues.selectedIndexMock))
                    }
                    
                }
            }
            
        }
    }
    
}
