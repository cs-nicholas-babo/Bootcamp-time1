//
//  ModalDetailPresenter.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

final class ModalDetailPresenter {
    unowned var viewController: ModalDetailDisplayLogic
    
    init(viewController: ModalDetailDisplayLogic){
        self.viewController = viewController
    }
}

extension ModalDetailPresenter : ModalDetailPresentationLogic {
    func show(cards: [Card], selectedIndex: Int) {
        let viewModel = ModalDetail.ViewModel.Subset(cards: cards, selectedIndex: selectedIndex)
        
        self.viewController.display(viewModel: viewModel)
    }
    
    func refreshButton(status: Bool) {
        viewController.displayButton(status: status)
    }
    
}
