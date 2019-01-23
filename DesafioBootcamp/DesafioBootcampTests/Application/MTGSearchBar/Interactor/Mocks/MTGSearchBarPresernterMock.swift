//
//  MTGSearchBarPresernterMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

@testable import DesafioBootcamp

class MTGSearchBarPresenterMock: MTGSearchBarPresentationLogic {
    var isSending: Bool = false
    var sets: [CardSet] = []
    
    func send(sets: [CardSet]) {
        isSending = true
        self.sets = sets
    }
}
