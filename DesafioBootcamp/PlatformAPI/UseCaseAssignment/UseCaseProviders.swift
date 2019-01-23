//
//  UseCaseProviders.swift
//  PlatformAPI
//
//  Created by g.guimaraes on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import PlatformLocalDatabase

public protocol MTG_ServiceProvider{
    func applicationStartupUseCase() -> Domain.ApplicationStartupUseCase
    func applicationRunningUseCase() -> Domain.ApplicationRunningUseCase
    func cardsUseCase() -> Domain.CardsUseCase
}

public final class MTG_ProviderDefault : PlatformAPI.MTG_ServiceProvider {
    
    let service: MTG_Service
    
    public init() {
        self.service = MTG_Service()
    }
    
    public func applicationStartupUseCase() -> ApplicationStartupUseCase {
        return service
    }
    
    public func applicationRunningUseCase() -> ApplicationRunningUseCase {
        return service
    }
    
    public func cardsUseCase() -> CardsUseCase {
        return service
    }
}

public final class MTG_ProviderTesting: PlatformAPI.MTG_ServiceProvider {
    
    let service: MTG_Service
    
    public init() {
        self.service = MTG_Service(databaseProvider: TestCacheServiceProvider())
    }
    
    public func applicationStartupUseCase() -> ApplicationStartupUseCase {
        return service
    }
    
    public func applicationRunningUseCase() -> ApplicationRunningUseCase {
        return service
    }
    
    public func cardsUseCase() -> CardsUseCase {
        return service
    }
}
