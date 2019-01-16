//
//  UseCaseProviders.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import RealmSwift

public final class FavoriteCardsServiceProvider: Domain.FavoriteCardsUseCaseProvider {
    
    public init() { }
    
    public func useCase() -> FavoriteCardsUseCase {
        let repository = FavoriteCardsRepository(realm: try! Realm())
        return FavoriteCardsService(repository: repository)
    }

}

public final class CacheServiceProvider: Domain.ApplicationRunningUseCaseProvider {
    
    public init() { }
    
    public func useCase() -> ApplicationRunningUseCase {
        let manager = CacheManager(realm: try! Realm())
        
        return CacheService(cacheManager: manager)
    }
    
    
}
