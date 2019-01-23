//
//  LocalDatabaseGateway.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain

final class LocalDatabaseGateway: MTGSetFetcher{
    
    let favoritesService: FavoriteCardsUseCase
    let cacheService: ApplicationRunningUseCase
    
    init(favoritesService: FavoriteCardsUseCase, cacheService: ApplicationRunningUseCase) {
        self.favoritesService = favoritesService
        self.cacheService = cacheService
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
}
