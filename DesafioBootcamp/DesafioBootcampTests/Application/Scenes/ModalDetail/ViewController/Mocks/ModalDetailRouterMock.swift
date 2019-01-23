//
//  ModalDetailRouterMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

@testable import DesafioBootcamp

class ModalDetailRouterMock: ModalDetailRoutingLogic {
    var toDismiss: Bool = false
    
    func dismiss() {
        toDismiss = true
    }
}
