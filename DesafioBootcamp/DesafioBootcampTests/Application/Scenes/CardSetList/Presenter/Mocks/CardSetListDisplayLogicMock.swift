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
    
    var viewModel: CardSetList.ViewModel?
    var didDisplayViewModel = false
    var isReadyToDisplayCards = false
    var didDisplayError = false
    
    func display(viewModel: CardSetList.ViewModel) {
        self.viewModel = viewModel
        self.didDisplayViewModel = true
    }
    
    func readyToDisplayCards() {
        self.isReadyToDisplayCards = true
    }
    
    func displayError() {
        self.didDisplayError = true
    }
    
}
