//
//  LocalDatabaseFactory.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import PlatformLocalDatabase

final class LocalDatabaseFactory {
    static func make() -> MTGCardGateway {
        let localDatabase = LocalDatabaseGateway(favoritesService: FavoritesServiceFactory.make(), cacheService: CacheServiceFactory.make())
        return localDatabase
    }
}
