//
//  MTGSearchBarDisplayLogicMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

@testable import DesafioBootcamp

class MTGSearchBarDisplayLogicMock: MTGSearchBarDisplayLogic {
    var toBeDisplayed: Bool = false
    var sets: [CardSet] = []
    
    func display(sets: [CardSet]) {
        toBeDisplayed = true
        self.sets = sets
    }
    
}
