//
//  FavoriteCardsUseCaseMock.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain

final class FavoriteCardsUseCaseMock: FavoriteCardsUseCase {
    
    var shouldFail = false
    let sentCardSets = MockValues.cardSetMockArray
    
    var result: Result<[CardSet]> {
        return self.shouldFail ?  Result.failure(DomainError(errorCode: "", error: ResultErrorMock.error)) : Result.success(sentCardSets)
    }
    
    func fetchFavoriteCards(query: String, handler: @escaping (Result<[CardSet]>) -> ()) {
        handler(self.result)
    }
    
    func fetchFavoriteCards(handler: @escaping (Result<[CardSet]>) -> ()) {
        handler(self.result)
    }
    
    func favorite(card: Card, status: Bool) {
        // TODO
    }
    
    
}
