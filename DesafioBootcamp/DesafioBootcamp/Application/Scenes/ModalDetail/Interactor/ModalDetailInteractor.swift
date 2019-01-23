//
//  ModalDetailInteractor.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol ModalDetailBusinessLogic {
    func toggleFavorite()
    func show()
}

final class ModalDetailInteractor {
    private let presenter: ModalDetailPresentationLogic
    private let useCase: FavoriteCardsUseCase
    
    private var cards: [Card]
    private var selectedIndex: Int
    private var favoriteCardsIndexes: [Int]
    
    private func indexedCard() -> Card {
        return self.cards[self.selectedIndex]
    }
    
    init(presenter: ModalDetailPresentationLogic, useCase: FavoriteCardsUseCase, subset: ModalDetail.ViewModel.Subset) {
        self.presenter = presenter
        self.useCase = useCase
        self.cards = subset.cards
        self.selectedIndex = subset.selectedIndex
        self.favoriteCardsIndexes = subset.favoriteCardsIndexes
    }
}

extension ModalDetailInteractor: ModalDetailBusinessLogic {
    func toggleFavorite() {
        useCase.fetchFavoriteCards { (result) in
            switch result {
            case .success(let cardsets):
                let allCards = cardsets.flatMap({ $0.cards })
                let favoriteFlag = !allCards.contains(self.indexedCard())
                self.useCase.favorite(card: self.indexedCard(), status: favoriteFlag)
                self.presenter.toggleButton(status: favoriteFlag)
            default:
                break
            }
        }
    }
    
    func show() {
        presenter.show(cards: cards, selectedIndex: selectedIndex, favoriteCardsIndexes: favoriteCardsIndexes)
    }
    
}
