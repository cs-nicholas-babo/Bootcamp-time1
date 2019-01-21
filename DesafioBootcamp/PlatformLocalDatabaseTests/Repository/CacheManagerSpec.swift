//
//  PlatformLocalDatabaseTests.swift
//  PlatformLocalDatabaseTests
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Realm
import RealmSwift

@testable import PlatformLocalDatabase
@testable import Domain

class CacheManagerSpec: QuickSpec {
    
    override func spec() {
        let realm = RealmConfig.test
        let manager = CacheManager(realm: realm)
        
        describe("When using a CacheManager") {
            describe("and its setSetRepository", closure: {
                
                let repo = manager.cardSetRepository
                
                beforeEach {
                    repo.deleteAll()
                }

                describe("a query for all objects", closure: {
                    it("should return all stored objects", closure: {
                        let set1 = RealmCardSetMock.set1
                        let set2 = RealmCardSetMock.set2
                        let set3 = RealmCardSetMock.set3
                        
                        repo.upsert(object: set1.baseData())
                        repo.upsert(object: set2.baseData())
                        repo.upsert(object: set3.baseData())
                        
                        
                        let allObjects = repo.get()
                        expect(allObjects.count) == 3
                        
                    })
                })
                
                describe("a realm object stored", closure: {
                    it("should have the correct properties associated", closure: {
                        let set = RealmCardSetMock.set1
                        
                        repo.upsert(object: set.baseData())
                        
                        let storedCard = realm.objects(RealmCardSet.self).first
                        expect(storedCard?.name) == "name1"
                        expect(storedCard?.code) == "code1"
                    })
                })
                
                describe("the deleteAll function", closure: {
                    it("should erase all records from the database", closure: {
                        let set1 = RealmCardSetMock.set1
                        let set2 = RealmCardSetMock.set2
                        let set3 = RealmCardSetMock.set3
                        
                        repo.upsert(object: set1.baseData())
                        repo.upsert(object: set2.baseData())
                        repo.upsert(object: set3.baseData())
                        
                        expect(repo.get().count) == 3
                        
                        repo.deleteAll()
                        
                        expect(repo.get().count) == 0
                    })
                })
                
                describe("the delete function", closure: {
                    it("should erase the specified record from the database", closure: {
                        let set1 = RealmCardSetMock.set1
                        let set2 = RealmCardSetMock.set2
                        
                        repo.upsert(object: set1.baseData())
                        repo.upsert(object: set2.baseData())
                        
                        expect(repo.get().count) == 2
                        
                        repo.delete(object: set1.baseData())
                        
                        expect(repo.get().count) == 1
                        expect(repo.get().first?.code) == "code2"
                    })
                })
                
                
            })
            
        }
        
    }
    
}
