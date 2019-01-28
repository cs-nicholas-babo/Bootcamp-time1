//
//  CardSetListViewControllerSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class CardSetListViewControllerSpec: QuickSpec {

    override func spec() {
        describe("CardSetList View Controller") {
            
            var sut: CardSetListViewController!
            
            context("when initialized") {
                
                var interactor: CardSetListInteractorMock!
                
                beforeEach {
                    sut = CardSetListViewController()
                    interactor = CardSetListInteractorMock()
                    sut.interactor = interactor
                }
                
                context("and display view model") {
                    
                    beforeEach {
                        sut.display(viewModel: MockValues.viewModel)
                    }
                    
                    it("should enter show cards state") {
                        expect(sut.stateMachine.currentState).to(beAKindOf(CardSetListShowCardsState.self))
                    }
                    
                    it("should feed data source") {
                        expect(sut.wrapperView.datasource.sets).to(contain(MockValues.viewModel))
                    }
                    
                }
                
                context("and get ready to display cards") {
                    
                    beforeEach {
                        sut.readyToDisplayCards()
                    }
                    
                    it("should fetch set") {
                        expect(interactor.didFetchSet).to(beTrue())
                    }
                    
                }
                
                context("and display error") {
                    
                    beforeEach {
                        sut.displayError()
                    }
                    
                    it("should enter error state") {
                        expect(sut.stateMachine.currentState).to(beAKindOf(CardSetListErrorState.self))
                    }
                    
                }
                
                context("and display no rsults") {
                    beforeEach {
                        sut.displayNoResults()
                    }
                    
                    it("should enter no results state") {
                        expect(sut.stateMachine.currentState).to(beAKindOf(CardSetListNoResultsState.self))
                    }
                }
                
            }
            
            context("when initialized with coder") {
                
                it("should raise a exception") {
                    let archiver = NSKeyedArchiver(requiringSecureCoding: false)
                    expect(CardSetListViewController(coder: archiver)).to(raiseException())
                }
                
            }
            
        }
    }
    
}
