//
//  LocalDatabaseGateway.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import PlatformLocalDatabase
import Realm
import RealmSwift

final class LocalDatabaseGateway: MTGCardGateway{
    
    let service: FavoriteCardsUseCase
    let cacheService: ApplicationRunningUseCase
    
    init(favoritesService: FavoriteCardsUseCase, cacheService: ApplicationRunningUseCase) {
        let realm = try! Realm()
        let repo = FavoriteCardsRepository(realm: realm)
        let manager = CacheManager(realm: realm)
        service = FavoriteCardsService(repository: repo, manager: manager)
        
        cacheService = CacheService(cacheManager: manager)
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
        service.fetchFavoriteCards { result in
            switch result{
            case .success(let cardSets):
                completion(.success(cardSets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCards(named: String, _ completion: @escaping (Result<[Card]>) -> Void) {
        service.fetchFavoriteCards(query: named) { result in
            switch result{
            case .success(let cards):
                completion(.success(cards.first!.cards))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
