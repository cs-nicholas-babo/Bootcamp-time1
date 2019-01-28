//
//  MTGSearchBarInteractorMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

@testable import DesafioBootcamp

class MTGSearchBarInteractorMock: MTGSearchBarBusinessLogic {
    var isSearching: Bool = false
    var query: String = ""
    
    func search(query: String) {
        isSearching = true
        self.query = query
    }
}
