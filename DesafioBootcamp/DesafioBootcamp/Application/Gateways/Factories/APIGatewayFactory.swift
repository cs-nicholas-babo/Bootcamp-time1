//
//  APIGatewayFactory.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain
import PlatformAPI

final class APIGatewayFactory {
    
    static func make() -> MTGSetFetcher {
        return APIGateway(service: service)
    }
    
    private static var service: ApplicationRunningUseCase & CardsUseCase {
        return MTG_Service()
    }
}
