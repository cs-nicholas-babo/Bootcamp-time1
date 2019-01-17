//
//  FavoriteCardsService.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

public final class FavoriteCardsService: Domain.FavoriteCardsUseCase {
    private let repository: FavoriteCardsRepository
    private let manager: CacheManager
    
    public init(repository: FavoriteCardsRepository, manager: CacheManager){
        self.repository = repository
        self.manager = manager
    }
    
    public func fetchFavoriteCards(query: String, handler: @escaping (Result<[CardSet]>) -> ()) {
        handler( Result.success(repository.fetchFavoriteCardSets(query: query, from: manager.cardSetRepository.get())) )
    }
    
    public func fetchFavoriteCards(handler: @escaping (Result<[CardSet]>) -> ()) {
        handler( Result.success(repository.fetchFavoriteCardSets(query: nil, from: manager.cardSetRepository.get())) )
    }
    
    public func favorite(card: Card, status: Bool) {
        if (status) {
            repository.upsert(object: card)
        } else {
            repository.delete(object: card)
        }
    }

}
