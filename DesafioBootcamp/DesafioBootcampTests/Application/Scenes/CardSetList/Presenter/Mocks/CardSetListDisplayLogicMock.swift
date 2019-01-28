//
//  CardSetListDisplayLogicMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

@testable import DesafioBootcamp

class CardSetListDisplayLogicMock: CardSetListDisplayLogic {
    
    var receivedViewModels: CardSetList.ViewModel?
    var didDisplayViewModel = false
    var isReadyToDisplayCards = false
    var didDisplayError = false
    var didDisplayNoResults = false
    var didDisplaySearchResults = false
    
    func display(viewModel: CardSetList.ViewModel) {
        self.receivedViewModels = viewModel
        self.didDisplayViewModel = true
    }
    
    
    func displayNoResults() {
        self.didDisplayNoResults = true
    }
    
    func readyToDisplayCards() {
        self.isReadyToDisplayCards = true
    }
    
    func displayError() {
        self.didDisplayError = true
    }
    
    func displaySearchResults(viewModel: [CardSetList.ViewModel]) {
        self.didDisplaySearchResults = true
    }
}
