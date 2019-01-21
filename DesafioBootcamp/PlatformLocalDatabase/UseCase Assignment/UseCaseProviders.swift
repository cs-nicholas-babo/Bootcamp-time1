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
    
    let realm = RealmConfig.production
    
    public init() { }
    
    public func useCase() -> FavoriteCardsUseCase {
        let repository = FavoriteCardsRepository(realm: realm)
        let manager = CacheManager(realm: realm)
        return FavoriteCardsService(repository: repository, manager: manager)
    }

}

public final class CacheServiceProvider: Domain.ApplicationRunningUseCaseProvider {
    
    public init() { }
    
    public func useCase() -> ApplicationRunningUseCase {
        let manager = CacheManager(realm: RealmConfig.production)
        
        return CacheService(cacheManager: manager)
    }
    
    
}

public final class TestCacheServiceProvider: Domain.ApplicationRunningUseCaseProvider{
    
    public init() { }
    
    public func useCase() -> ApplicationRunningUseCase {
        let realm = RealmConfig.test
        
        let manager = CacheManager(realm: realm)
        
        return CacheService(cacheManager: manager)
    }
    
}
