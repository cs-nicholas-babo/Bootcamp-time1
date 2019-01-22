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
    
    private var card: Card
    private var status: Bool
    
    init(presenter: ModalDetailPresentationLogic, useCase: FavoriteCardsUseCase) {
        self.presenter = presenter
        self.useCase = useCase
        self.card = Card(id: "", name: "", setCode: "", types: Set<CardType>())
        self.status = false
    }
    
    convenience init(presenter: ModalDetailPresentationLogic, useCase: FavoriteCardsUseCase, card: Card, status: Bool) {
        self.init(presenter: presenter, useCase: useCase)
        self.card = card
        self.status = status
    }
}

extension ModalDetailInteractor: ModalDetailBusinessLogic {
    func toggleFavorite() {
        useCase.fetchFavoriteCards { (result) in
            switch result {
            case .success(let cardsets):
                let allCards = cardsets.flatMap({ $0.cards })
                self.status = !allCards.contains(self.card)
                self.useCase.favorite(card: self.card, status: self.status)
                self.presenter.toggleButton(status: self.status)
            default:
                break
            }
        }
    }
    
    func show() {
        presenter.show(card: card, status: status)
    }
}
