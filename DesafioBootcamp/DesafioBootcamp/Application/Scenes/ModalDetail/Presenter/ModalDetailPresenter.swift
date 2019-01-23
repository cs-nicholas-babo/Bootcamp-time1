//
//  ModalDetailPresenter.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol ModalDetailPresentationLogic {
    func show(card: Card, status: Bool)
//  func show(cards: [Card], indexPath: IndexPath, favoritePathes: [indexPath])
    func toggleButton(status: Bool)
}

final class ModalDetailPresenter {
    unowned var viewController: ModalDetailDisplayLogic
    
    init(viewController: ModalDetailDisplayLogic){
        self.viewController = viewController
    }
}

extension ModalDetailPresenter : ModalDetailPresentationLogic {
    func show(card: Card, status: Bool) {
        viewController.display(viewModel: ModalDetail.ViewModel(card: card, status: status))
    }
    
    func toggleButton(status: Bool) {
        viewController.displayButton(status: status)
    }
    
}
