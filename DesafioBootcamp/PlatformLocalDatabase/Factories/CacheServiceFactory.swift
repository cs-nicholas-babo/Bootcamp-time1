//
//  CacheServiceFactory.swift
//  PlatformLocalDatabase
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain

public final class CacheServiceFactory {
    public static func make() -> ApplicationRunningUseCase {
        let manager = CacheManager(realm: realm())
        return CacheService(cacheManager: manager)
    }
}

extension CacheServiceFactory: RealmFactory {}
