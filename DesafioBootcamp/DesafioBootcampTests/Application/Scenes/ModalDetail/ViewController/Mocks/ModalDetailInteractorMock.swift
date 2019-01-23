//
//  ModalDetailInteractorMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

@testable import DesafioBootcamp

class ModalDetailInteractorMock: ModalDetailBusinessLogic {
    var toToggleFavorite: Bool = false
    var toShow: Bool = false
    
    func toggleFavorite() {
        toToggleFavorite = true
    }
    
    func show() {
        toShow = true
    }
    
    
    
}
