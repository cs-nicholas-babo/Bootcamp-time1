//
//  LocalDatabaseGateway.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain

final class LocalDatabaseGateway: MTGCardGateway{
    
    let favoritesService: FavoriteCardsUseCase
    let cacheService: ApplicationRunningUseCase
    
    init(favoritesService: FavoriteCardsUseCase, cacheService: ApplicationRunningUseCase) {
        self.favoritesService = favoritesService
        self.cacheService = cacheService
    }
    
    func fetchMetaSets(_ completion: @escaping (Result<[MetaCardSet]>) -> Void) {
        cacheService.fetchSets { result in
            switch result{
            case .success(let cards):
                completion(.success(cards))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchSets(_ completion: @escaping (Result<[CardSet]>) -> Void) {
        favoritesService.fetchFavoriteCards { result in
            switch result{
            case .success(let cardSets):
                completion(.success(cardSets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCards(named: String, _ completion: @escaping (Result<[Card]>) -> Void) {
        favoritesService.fetchFavoriteCards(query: named) { result in
            switch result{
            case .success(let cards):
                completion(.success(cards.first!.cards))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
