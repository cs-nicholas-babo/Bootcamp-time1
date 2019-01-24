//
//  ModalDetailViewControllerSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class ModalDetailViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("ModalDetail ViewController") {
            
            var sut: ModalDetailViewController!
            
            context("when initialized") {
                
                var interactor: ModalDetailInteractorMock!
                var router: ModalDetailRouterMock!
                
                beforeEach {
                    interactor = ModalDetailInteractorMock()
                    router = ModalDetailRouterMock()
                    sut = ModalDetailViewController()
                    sut.interactor = interactor
                    sut.router = router
                }
                
                context("when tapping favorite button") {
                    
                    it("should favorite card") {
                        sut.tapFavoriteButton()
                        expect(interactor.toToggleFavorite).to(beTrue())
                    }
                    
                }
                
                context("when request cards to show") {
                    
                    it("should show cards") {
                        sut.viewWillAppear(false)
                        expect(interactor.toShow).to(beTrue())
                    }
                    
                }
                
                context("when tapping dismiss button") {
                    
                    it("should dismiss view") {
                        sut.tapDismissButton()
                        expect(router.toDismiss).to(beTrue())
                    }
                    
                }
                
                context("when changing current displayed card") {
                    
                    it("should change index") {
                        sut.didChangeTo(row: MockValues.selectedIndexMock)
                        expect(interactor.toChangeIndex).to(beTrue())
                        expect(interactor.newIndex).to(equal(MockValues.selectedIndexMock))
                    }
                    
                }
                
            }
            
        }
    }
    
}

