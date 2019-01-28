//
//  FavoritesServiceFactory.swift
//  PlatformLocalDatabase
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain

public final class FavoritesServiceFactory {
    public static func make() -> FavoriteCardsUseCase {
        let repo = FavoriteCardsRepository(realm: realm())
        let manager = CacheManager(realm: realm())
        return FavoriteCardsService(repository: repo, manager: manager)
    }
}

extension FavoritesServiceFactory: RealmFactory {}
