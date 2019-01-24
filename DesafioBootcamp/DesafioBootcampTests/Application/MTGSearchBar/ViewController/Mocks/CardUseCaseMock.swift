//
//  CardUseCaseMock.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

class CardUseCaseMock: CardsUseCase {
    var isFetchingCardsFromSet: Bool = false
    var isFetchingCardsFromFilter: Bool = false
    
    func fetchCards(from set: MetaCardSet, handler: @escaping (Result<[Card]>) -> ()) {
        isFetchingCardsFromSet = true
        handler(Result.success([MockValues.cardMock]))
    }
    
    func fetchCards(filter name: String, handler: @escaping (Result<[Card]>) -> ()) {
        isFetchingCardsFromFilter = true
        handler(Result.success([MockValues.cardMock]))
    }
    
    
}
