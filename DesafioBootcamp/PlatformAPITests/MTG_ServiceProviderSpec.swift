//
//  MTG_ServiceProviderSpec.swift
//  PlatformAPITests
//
//  Created by nicholas.r.babo on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PlatformAPI

final class MTG_ServiceProviderSpec: QuickSpec{
    
    override func spec() {
        
        var defaultProvider: MTG_ProviderDefault!
        var testProvider: MTG_ProviderTesting!
        
        beforeEach {
            testProvider = MTG_ProviderTesting()
            defaultProvider = MTG_ProviderDefault()
        }
        
        describe("When using a default MTG_ServiceProvider") {
            describe("an initialized provider", {
                it("should have a valid instance", closure: {
                    expect(defaultProvider).toNot(beNil())
                })
            })
            
            describe("its application startup use case ", {
                it("should return the expected value", closure: {
                    expect(defaultProvider.applicationStartupUseCase()).toNot(beNil())
                })
            })
            
            describe("its application running use case ", {
                it("should return the expected value", closure: {
                    expect(defaultProvider.applicationRunningUseCase()).toNot(beNil())
                })
            })
            
            describe("its cards use case ", {
                it("should return the expected value", closure: {
                    expect(defaultProvider.cardsUseCase()).toNot(beNil())
                })
            })
        }
        
        describe("When using a test MTG_ServiceProvider") {
            describe("an initialized provider", {
                it("should have a valid instance", closure: {
                    expect(testProvider).toNot(beNil())
                })
            })
            
            describe("its application startup use case ", {
                it("should return the expected value", closure: {
                    expect(testProvider.applicationStartupUseCase()).toNot(beNil())
                })
            })
            
            describe("its application running use case ", {
                it("should return the expected value", closure: {
                    expect(testProvider.applicationRunningUseCase()).toNot(beNil())
                })
            })
            
            describe("its cards use case ", {
                it("should return the expected value", closure: {
                    expect(testProvider.cardsUseCase()).toNot(beNil())
                })
            })
        }
        
    }
    
}
