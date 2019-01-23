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
                    
                    it("should display card with status") {
                        sut.show(card: MockValues.cardMock, status: MockValues.favoriteStatusMock)
                        expect(viewController.toDisplayViewModel).to(beTrue())
                        expect(viewController.status).to(beTrue())
                    }
                    
                }
                
                context("when toggle favorite") {
                    
                    it("should favorite card") {
                        sut.toggleButton(status: MockValues.favoriteStatusMock)
                        expect(viewController.toDisplayButton).to(beTrue())
                        expect(viewController.status).to(beTrue())
                    }
                    
                }
            }
            
        }
    }
    
}
