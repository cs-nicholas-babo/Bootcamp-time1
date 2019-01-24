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
    func changeIndex(row: Int)
    func show()
}

final class ModalDetailInteractor {
    private let presenter: ModalDetailPresentationLogic
    private let useCase: FavoriteCardsUseCase
    
    private var cards: [Card]
    private var selectedIndex: Int
    private var favoriteCardsUID: Set<String>
    
    private func indexedCard() -> Card {
        return self.cards[self.selectedIndex]
    }
    
    init(presenter: ModalDetailPresentationLogic, useCase: FavoriteCardsUseCase, subset: ModalDetail.ViewModel.Subset) {
        self.presenter = presenter
        self.useCase = useCase
        self.cards = subset.cards
        self.selectedIndex = subset.selectedIndex
        self.favoriteCardsUID = []
        
        self.useCase.fetchFavoriteCards { (result) in
            switch result {
            case .success(let favorites):
                self.favoriteCardsUID = Set(favorites.flatMap({ $0.cards }).compactMap({ $0.id }))
                self.presenter.refreshButton(status: self.isFavorite())
            default:
                break
            }
        }
    }
    
    func isFavorite() -> Bool {
        return favoriteCardsUID.contains(cards[selectedIndex].id)
    }
}

extension ModalDetailInteractor: ModalDetailBusinessLogic {
    func changeIndex(row: Int) {
        selectedIndex = row
        presenter.refreshButton(status: isFavorite())
    }
    
    func toggleFavorite() {
        let toggle = !isFavorite()
        useCase.favorite(card: cards[selectedIndex], status: toggle)
        if toggle {
            favoriteCardsUID.insert(cards[selectedIndex].id)
        } else {
            favoriteCardsUID.remove(cards[selectedIndex].id)
        }
        presenter.refreshButton(status: toggle)
    }
    
    func show() {
        presenter.show(cards: cards, selectedIndex: selectedIndex)
    }
    
}
