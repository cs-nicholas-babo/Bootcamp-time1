//
//  ModalDetailPresenterMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

@testable import DesafioBootcamp

class ModalDetailPresenterMock: ModalDetailPresentationLogic {
    var status: Bool = false
    var toShowCard: Bool = false
    var toToggleButton: Bool = false
    
    func show(card: Card, status: Bool) {
        self.toShowCard = true
        self.status = status
    }
    
    func toggleButton(status: Bool) {
        self.toToggleButton = true
        self.status = status
    }
    
    
}
