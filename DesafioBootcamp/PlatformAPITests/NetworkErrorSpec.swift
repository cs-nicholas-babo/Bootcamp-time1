//
//  NetworkErrorSpec.swift
//  PlatformAPITests
//
//  Created by nicholas.r.babo on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PlatformAPI
@testable import Domain

final public class NetworkErrorSpec: QuickSpec{
    
    public override func spec() {
        let error = NSError(domain: "NetworkErrorTest", code: 999, userInfo: nil)
        
        describe("A Network Error") {
            let decodingError = NetworkDomainError(errorCode: NetworkErrorCode.decodingError, error: error)
            let responseError = NetworkDomainError(errorCode: NetworkErrorCode.responseError, error: error)
            let spamError = NetworkDomainError(errorCode: NetworkErrorCode.spamProtectionError, error: error)
            
            describe("after being initialized", {
                it("should have a valid instance", closure: {
                    expect(decodingError).toNot(beNil())
                    expect(responseError).toNot(beNil())
                    expect(spamError).toNot(beNil())

                })
                
                it("should contain the correct value", closure: {
                    expect(decodingError.value().errorCode).to(equal(NetworkErrorCode.decodingError.rawValue))
                    expect(responseError.value().errorCode).to(equal(NetworkErrorCode.responseError.rawValue))
                    expect(spamError.value().errorCode).to(equal(NetworkErrorCode.spamProtectionError.rawValue))
                })
            })
        }
        
    }
    
}
