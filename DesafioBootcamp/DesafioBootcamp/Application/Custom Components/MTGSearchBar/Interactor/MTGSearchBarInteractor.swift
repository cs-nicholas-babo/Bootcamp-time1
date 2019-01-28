//
//  MTGSearchBarInteractor.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol MTGSearchBarBusinessLogic {
    func search(query: String)
}

final class MTGSearchBarInteractor {
    private let presenter: MTGSearchBarPresentationLogic
    private let applicationUseCase: ApplicationRunningUseCase
    private var cardsUseCase: CardsUseCase?
    private var favoriteCardsUseCase: FavoriteCardsUseCase?
    
    init(applicationUseCase: ApplicationRunningUseCase, cardsUseCase: CardsUseCase, presenter: MTGSearchBarPresentationLogic) {
        self.applicationUseCase = applicationUseCase
        self.cardsUseCase = cardsUseCase
        self.presenter = presenter
    }
    
    init(applicationUseCase: ApplicationRunningUseCase, favoriteCardsUseCase: FavoriteCardsUseCase, presenter: MTGSearchBarPresentationLogic) {
        self.applicationUseCase = applicationUseCase
        self.favoriteCardsUseCase = favoriteCardsUseCase
        self.presenter = presenter
    }
    
}

extension MTGSearchBarInteractor: MTGSearchBarBusinessLogic {
    func search(query: String)  {
        if let cardsUseCase = cardsUseCase {
            cardsUseCase.fetchCards(filter: query) { (resultCards) in
                switch resultCards {
                case .success(let cards):
                    self.applicationUseCase.fetchSets(handler: { (resultMetaSet) in
                        switch resultMetaSet {
                        case .success(let metaSets):
                            let sets = CardManipulator.mountCardSets(from: metaSets, using: cards)
                            self.presenter.send(sets: sets)
                        default:
                            break
                        }
                    })
                default:
                    break
                }
            }
        } else if let favoriteCardsUseCase = favoriteCardsUseCase {
            favoriteCardsUseCase.fetchFavoriteCards(query: query) { (resultSets) in
                switch resultSets {
                case .success(let sets):
                    self.presenter.send(sets: sets)
                default:
                    break
                }
            }
        }
    }

}
