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
    func show(cards: [Card], selectedIndex: Int, favoriteCardsIndexes: [Int])
    func toggleButton(status: Bool)
}

final class ModalDetailPresenter {
    unowned var viewController: ModalDetailDisplayLogic
    
    init(viewController: ModalDetailDisplayLogic){
        self.viewController = viewController
    }
}

extension ModalDetailPresenter : ModalDetailPresentationLogic {
    func show(cards: [Card], selectedIndex: Int, favoriteCardsIndexes: [Int]) {
        let card = cards[selectedIndex]
        let status = favoriteCardsIndexes.contains(selectedIndex)
        
        let viewModel = ModalDetail.ViewModel.Subset(cards: cards, selectedIndex: selectedIndex, favoriteCardsIndexes: favoriteCardsIndexes)
        
        self.viewController.display(viewModel: viewModel)
    }
    
    func toggleButton(status: Bool) {
        viewController.displayButton(status: status)
    }
    
}
