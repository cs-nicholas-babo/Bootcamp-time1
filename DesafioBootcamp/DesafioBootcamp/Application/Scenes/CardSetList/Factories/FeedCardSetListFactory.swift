//
//  FeedCardSetListFactory.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

final class FeedCardSetListFactory: CardSetListFactory{
    static func makeMTGCardGateway() -> MTGSetFetcher {
        let localDatabaseGateway = APIGatewayFactory.make()
        return localDatabaseGateway
    }
}
