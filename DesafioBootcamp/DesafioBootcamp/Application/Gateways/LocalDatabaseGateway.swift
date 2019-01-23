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
    
    init(favoritesService: FavoriteCardsUseCase) {
        self.favoritesService = favoritesService
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
