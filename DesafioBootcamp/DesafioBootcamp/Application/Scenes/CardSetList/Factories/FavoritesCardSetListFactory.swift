//
//  CardSetListFactoryImplementation.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

final class FavoritesCardSetListFactory: CardSetListFactory{
    static func makeMTGCardGateway() -> MTGSetFetcher {
        let localDatabaseGateway = LocalDatabaseGatewayFactory.make()
        return localDatabaseGateway
    }
}
