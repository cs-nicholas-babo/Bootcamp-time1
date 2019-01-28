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

final class MTGCardGatewayMock: MTGSetFetcher {
    
    var shouldFail = false
    var didCallfetchSet = false
    var didCallfetchCards = false
    
    var sentCardSets = [CardSet]()
    
    func fetchSets(_ completion: @escaping (Result<[CardSet]>) -> Void) {
        let cardSets = MockValues.cardSetMockArray
        prepareFetch(result: cardSets, completion: completion)
        self.didCallfetchSet = true
        self.sentCardSets = cardSets
    }
    
    func fetchCards(named: String, _ completion: @escaping (Result<[Card]>) -> Void) {
        prepareFetch(result: MockValues.cardMockArray, completion: completion)
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
