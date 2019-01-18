//
//  MTGCardGatewayMock.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
@testable import DesafioBootcamp

final class MTGCardGatewayMock: MTGCardGateway {
    
    var shouldFail = false

    var didCallFetchMetaSets = false
    var didCallfetchSet = false
    var didCallfetchCards = false
    
    func fetchMetaSets(_ completion: @escaping (Result<[MetaCardSet]>) -> Void) {
        prepareFetch(result: MockValues.metaCardSetsMock, completion: completion)
        self.didCallFetchMetaSets = true
    }
    
    func fetchSet(of: MetaCardSet, _ completion: @escaping (Result<CardSet>) -> Void) {
        prepareFetch(result: MockValues.cardSetMock, completion: completion)
        self.didCallfetchSet = true
    }
    
    func fetchCards(named: String, _ completion: @escaping (Result<[Card]>) -> Void) {
        prepareFetch(result: MockValues.cardsMock, completion: completion)
        self.didCallfetchCards = true
    }
    
    func prepareFetch<T>(result: T, completion: @escaping (Result<T>) -> Void) {
        if shouldFail {
            completion(.failure(DomainError(errorCode: "fetchMetaSets", error: ResultErrorMock.error)))
        } else {
            completion(.success(result))
        }
    }
}
