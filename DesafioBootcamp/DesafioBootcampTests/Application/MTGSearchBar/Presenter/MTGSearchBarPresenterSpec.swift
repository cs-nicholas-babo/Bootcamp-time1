//
//  MTGSearchBarPresenterSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class MTGSearchBarPresenterSpec: QuickSpec {
    
    override func spec() {
        describe("MTG SearchBar Presenter") {
            
            var sut: MTGSearchBarPresenter!
            
            context("when initialized") {
                
                var viewController: MTGSearchBarDisplayLogicMock!
                
                beforeEach {
                    viewController = MTGSearchBarDisplayLogicMock()
                    sut = MTGSearchBarPresenter(viewController: viewController)
                }
                
                // TODO: Change to cardSetMockArray
                it("should send sets for display") {
                    sut.send(sets: [MockValues.cardSetMock])
                    expect(viewController.toBeDisplayed).to(beTrue())
                    expect(viewController.sets.count).to(equal([MockValues.cardSetMock].count))
                }
                
            }
            
        }
    }
    
}

