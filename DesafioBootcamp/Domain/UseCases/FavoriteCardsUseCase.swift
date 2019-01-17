//
//  FavoriteCardsUseCase.swift
//  Domain
//
//  Created by g.guimaraes on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public protocol FavoriteCardsUseCase {
    func fetchFavoriteCards(query: String, handler: @escaping (Result<[CardSet]>) -> ())
    func fetchFavoriteCards(handler: @escaping (Result<[CardSet]>) -> ())
    func favorite(card: Card, status: Bool)
}
