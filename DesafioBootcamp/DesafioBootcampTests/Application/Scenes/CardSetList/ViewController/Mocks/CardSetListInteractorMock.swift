//
//  CardSetListInteractorMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class CardSetListInteractorMock: CardSetListBusinessLogic {
    
    var didFetchSet = false
    
    func fetchSet() {
        didFetchSet = true
    }
    
}
