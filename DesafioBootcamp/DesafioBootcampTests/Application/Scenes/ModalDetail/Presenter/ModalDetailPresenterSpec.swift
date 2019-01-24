//
//  ModalDetailPresenterSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class ModalDetailPresenterSpec: QuickSpec {
    
    override func spec() {
        describe("ModalDetail Presenter") {
            
            var sut: ModalDetailPresenter!
            
            context("when initialized") {
                
                var viewController: ModalDetailViewControllerMock!
                
                beforeEach {
                    viewController = ModalDetailViewControllerMock()
                    sut = ModalDetailPresenter(viewController: viewController)
                }
                
                context("when display card") {
                    
//                    it("should display single card with status") {
//                        sut.show(cards: [MockValues.cardMock], selectedIndex: MockValues.selectedIndexMock)
//                        expect(viewController.toDisplayViewModelSingle).to(beTrue())
//                        expect(viewController.status).to(beTrue())
//                    }
                    
                    it("should display subset") {
                        sut.show(cards: [MockValues.cardMock], selectedIndex: MockValues.selectedIndexMock)
                        expect(viewController.toDisplayViewModelSubset).to(beTrue())
                        expect(viewController.selectedIndex).to(equal(MockValues.selectedIndexMock))
                    }
                    
                }
                
                context("when toggle favorite") {
                    
                    it("should favorite card") {
                        sut.refreshButton(status: MockValues.favoriteStatusMock)
                        expect(viewController.toDisplayButton).to(beTrue())
                        expect(viewController.status).to(beTrue())
                    }
                    
                }
            }
            
        }
    }
    
}
