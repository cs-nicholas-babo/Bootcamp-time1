//
//  SetRequestCacheSpec.swift
//  PlatformAPITests
//
//  Created by nicholas.r.babo on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Moya
import Alamofire
import Realm
import RealmSwift
import Domain

@testable import PlatformAPI
@testable import PlatformLocalDatabase

final class SetRequestCacheSpec: QuickSpec{
    
    override func spec() {
        let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
            done(.failure(MoyaError.underlying(NSError(domain: "forcedError", code: 999, userInfo: nil), nil)))
        }
        let errorProvider = MoyaProvider<MTG_Model>(requestClosure: requestClosure)
        let errorService = MTG_Service(provider: errorProvider, decoder: JSONDecoder.standardDecoder)
        
        var config = Realm.Configuration.defaultConfiguration
        config.inMemoryIdentifier = "com.DesafioBootcamp.Debug.Realm.CacheManager"
//        let realm = try! Realm(configuration: config)
        
        describe("When fetching sets") {
            describe("if the API is not Available", {
                it("should return the stored in cache", closure: {
                    let set1 = MetaCardSet(code: "code1", name: "name1", releaseDate: Date())
                    let set2 = MetaCardSet(code: "code2", name: "name2", releaseDate: Date())
                    
                    let cacheService = CacheServiceProvider().useCase()
                    cacheService.upsert(set: set1)
                    cacheService.upsert(set: set2)
                    
                    waitUntil(action: { done in
                        errorService.fetchSets(handler: { (result) in
                            switch result{
                            case .success(let cache):
                                expect(cache.count).to(equal(2))
                                done()
                            case .failure(_):
                                fail()
                                done()
                            }
                        })
                    })
                })
            })
        }
        
    }
    
}
