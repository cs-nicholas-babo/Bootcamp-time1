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

final class LocalDatabaseGatewayFactory {
    static func make() -> MTGSetFetcher {
        let localDatabaseGateway = LocalDatabaseGateway(favoritesService: FavoritesServiceFactory.make())
        return localDatabaseGateway
    }
}
