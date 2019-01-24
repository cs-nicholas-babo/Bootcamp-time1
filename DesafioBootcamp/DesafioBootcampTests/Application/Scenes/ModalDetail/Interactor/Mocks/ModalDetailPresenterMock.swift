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
    var toRefreshButton: Bool = false
    var selectedIndex: Int = 0
    
    func show(cards: [Card], selectedIndex: Int) {
        self.toShowCard = true
        self.selectedIndex = selectedIndex
    }
    
    func refreshButton(status: Bool) {
        self.toRefreshButton = true
        self.status = status
    }
    
}
