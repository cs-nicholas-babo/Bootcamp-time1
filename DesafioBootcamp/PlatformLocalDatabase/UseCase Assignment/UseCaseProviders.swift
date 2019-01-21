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
    
    let realm = try! Realm()
    
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
        let manager = CacheManager(realm: try! Realm())
        
        return CacheService(cacheManager: manager)
    }
    
    
}

public final class TestCacheServiceProvider: Domain.ApplicationRunningUseCaseProvider{
    
    public init() { }
    
    public func useCase() -> ApplicationRunningUseCase {
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "com.DesafioBootcamp.Debug.Realm.CacheManager"
        let realm = try! Realm(configuration: config)
        
        let manager = CacheManager(realm: realm)
        
        return CacheService(cacheManager: manager)
    }
    
}
