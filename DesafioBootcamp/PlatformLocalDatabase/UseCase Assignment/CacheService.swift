//
//  CacheService.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain
import Foundation

final public class CacheService: Domain.ApplicationRunningUseCase {
    let cacheManager: CacheManager
    
    public init(cacheManager: CacheManager) {
        self.cacheManager = cacheManager
    }
    
    public func fetchSets(handler: @escaping (Result<[MetaCardSet]>) -> ()) {
        handler(Result.success(cacheManager.cardSetRepository.get()))
    }
    
    public func favorite(set: MetaCardSet){
        self.cacheManager.cardSetRepository.upsert(object: set)
    }

    public func setupCache(sets: [MetaCardSet]) {
        sets.forEach { (set) in
            cacheManager.cardSetRepository.upsert(object: set)
        }
    }
    
}
