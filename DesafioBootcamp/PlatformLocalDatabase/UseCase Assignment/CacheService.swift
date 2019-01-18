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
    
    init(cacheManager: CacheManager) {
        self.cacheManager = cacheManager
    }
    
    public func fetchSets(handler: @escaping (Result<[MetaCardSet]>) -> ()) {
        handler(Result.success(cacheManager.cardSetRepository.get()))
    }
    
    public func upsert(set: MetaCardSet){
        self.cacheManager.cardSetRepository.upsert(object: set)
    }

}
