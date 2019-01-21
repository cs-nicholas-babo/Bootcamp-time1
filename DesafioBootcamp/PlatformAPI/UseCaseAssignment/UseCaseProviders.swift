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

public protocol MTG_ServiceProvider : class {
    func applicationStartupUseCase() -> Domain.ApplicationStartupUseCase
    func applicationRunningUseCase() -> Domain.ApplicationRunningUseCase
    func cardsUseCase() -> Domain.CardsUseCase
}

fileprivate var PROVIDER_KEY: UInt8 = 0
extension MTG_ServiceProvider {
    fileprivate var service: MTG_Service {
        get {
            return objc_getAssociatedObject(self, &PROVIDER_KEY) as! MTG_Service
        }
        set {
            objc_setAssociatedObject(self, &PROVIDER_KEY, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
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

public final class MTG_ProviderDefault : PlatformAPI.MTG_ServiceProvider {
    init() {
        self.service = MTG_Service()
    }
}

public final class MTG_ProviderTesting: PlatformAPI.MTG_ServiceProvider {
    public init() {
        self.service = MTG_Service(databaseProvider: TestCacheServiceProvider())
    }
}
