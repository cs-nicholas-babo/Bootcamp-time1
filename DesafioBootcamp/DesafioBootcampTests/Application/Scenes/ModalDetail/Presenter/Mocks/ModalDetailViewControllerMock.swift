//
//  ModalDetailViewControllerMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

@testable import DesafioBootcamp

class ModalDetailViewControllerMock: ModalDetailDisplayLogic {
    var status: Bool = false
    var toDisplayViewModel: Bool = false
    var toDisplayButton: Bool = false
    
    func display(viewModel: ModalDetail.ViewModel) {
        self.toDisplayViewModel = true
        self.status = viewModel.status
    }
    
    func displayButton(status: Bool) {
        self.toDisplayButton = true
        self.status = status
    }
    
}
