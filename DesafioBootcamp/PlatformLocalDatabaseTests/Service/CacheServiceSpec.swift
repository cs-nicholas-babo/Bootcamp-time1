//
//  CacheServiceSpec.swift
//  PlatformLocalDatabaseTests
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

import Realm
import RealmSwift

@testable import PlatformLocalDatabase
@testable import Domain

final public class CacheServiceSpec: QuickSpec{
    
    public override func spec() {
        
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "com.DesafioBootcamp.Debug.Realm.CacheManager"
        let realm = try! Realm(configuration: config)
        
        let manager = CacheManager(realm: realm)
        let cacheService = CacheService(cacheManager: manager)
        
        beforeSuite {
            cacheService.cacheManager.cardSetRepository.deleteAll()
        }
        
        describe("When using the CacheService") {
            describe("an instantiated Cache Service", {
                it("should have a valid manager", closure: {
                    let manager = CacheManager(realm: realm)
                    let service = CacheService(cacheManager: manager)
                    expect(service.cacheManager).toNot(beNil())
                })
            })
            describe("fetching sets", {
                it("should return the correct amount of stored sets", closure: {
                    let set1 = RealmCardSetMock.set1.baseData()
                    let set2 = RealmCardSetMock.set2.baseData()
                    
                    manager.cardSetRepository.upsert(object: set1)
                    manager.cardSetRepository.upsert(object: set2)
                    waitUntil(timeout: 3.0) { done in
                        cacheService.fetchSets(handler: { result in
                            switch result{
                            case .success(let sets):
                                expect(sets.count).to(equal(2))
                                done()
                            case .failure(_):
                                fail()
                                break
                            }
                        })
                    }
                    
                    
                })
            })
        }
        
        describe("When using the CacheServiceProvider") {
            describe("An instantiated Service Provider", {
                let service = CacheServiceProvider()
                it("should have be a valid instance", closure: {
                    expect(service).toNot(beNil())
                })
                
                it("should return a valid service", closure: {
                    expect(service.useCase()).toNot(beNil())
                })
            })
        }
        
    }
    
}
