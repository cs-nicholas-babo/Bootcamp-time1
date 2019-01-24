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
    var selectedIndex: Int = 0
    var toDisplayViewModelSingle: Bool = false
    var toDisplayViewModelSubset: Bool = false
    var toDisplayButton: Bool = false
    
    func display(viewModel: ModalDetail.ViewModel.Single) {
        toDisplayViewModelSingle = true
        status = viewModel.status
    }
    
    func display(viewModel: ModalDetail.ViewModel.Subset) {
        toDisplayViewModelSubset = true
        selectedIndex = viewModel.selectedIndex
    }
    
    func displayButton(status: Bool) {
        self.toDisplayButton = true
        self.status = status
    }
    
}
