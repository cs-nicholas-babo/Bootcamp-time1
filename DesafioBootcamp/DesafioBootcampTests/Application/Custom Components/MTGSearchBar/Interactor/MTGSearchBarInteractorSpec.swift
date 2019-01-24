//
//  MTGSearchBarInteractorSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import Domain
@testable import DesafioBootcamp
@testable import PlatformLocalDatabase

class MTGSearchBarInteractorSpec: QuickSpec {
    
    override func spec() {
        describe("MTG SearchBar Interactor") {
            
            var sut: MTGSearchBarInteractor!
            
            context("when initialized") {
                
                var applicationProvider: TestCacheServiceProvider!
                var cardsUseCase: CardUseCaseMock!
                var presenter: MTGSearchBarPresenterMock!
                
                beforeEach {
                    applicationProvider = TestCacheServiceProvider()
                    cardsUseCase = CardUseCaseMock()
                    presenter = MTGSearchBarPresenterMock()
                    sut = MTGSearchBarInteractor(applicationUseCase: applicationProvider.useCase(), cardsUseCase: cardsUseCase, presenter: presenter)
                }
                
                it("should query but don't have items because database is empty") {
                    sut.search(query: MockValues.searchBarTextMock)
                    expect(presenter.isSending).to(beTrue())
                    expect(presenter.sets.count).to(equal(0))
                }
                
            }
            
        }
    }
    
}

