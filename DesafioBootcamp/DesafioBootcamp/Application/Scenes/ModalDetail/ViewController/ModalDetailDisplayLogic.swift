//
//  ModalDetailDisplayLogic.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

protocol ModalDetailDisplayLogic: class {
    func display(viewModel: ModalDetail.ViewModel.Subset)
    func displayButton(status: Bool)
}
