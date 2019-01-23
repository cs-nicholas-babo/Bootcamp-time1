//
//  MTGSearchBarSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class MTGSearchBarSpec: QuickSpec {
    
    override func spec() {
        describe("MTG SearchBar") {
            
            var sut: MTGSearchBar!
            
            context("when initialized") {
                
                var observer: MTGSearchBarObserverMock!
                var interactor: MTGSearchBarInteractorMock!
                
                beforeEach {
                    interactor = MTGSearchBarInteractorMock()
                    observer = MTGSearchBarObserverMock()
                    sut = MTGSearchBar()
                    sut.observer = observer
                    sut.interactor = interactor
                }
                
                it("should have a delegate") {
                    expect(sut.delegate).toNot(beNil())
                }
                
                context("when searching") {
                    
                    it("should search and have the same query") {
                        sut.text = MockValues.searchBarTextMock
                        sut.delegate?.searchBarSearchButtonClicked!(sut)
                        expect(interactor.isSearching).to(beTrue())
                        expect(interactor.query).to(equal(MockValues.searchBarTextMock))
                    }
                    
                }
                
                context("when displaying set") {
                    
                    // TODO: - Use cardSetMockArray
                    it("should display the set") {
                        sut.display(sets: [MockValues.cardSetMock])
                        expect(observer.toSendCards).to(beTrue())
                        expect(observer.sets.count).to(equal([MockValues.cardSetMock].count))
                    }
                    
                }
                
            }
            
        }
    }
    
}

