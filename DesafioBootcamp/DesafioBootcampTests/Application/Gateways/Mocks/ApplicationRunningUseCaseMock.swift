//
//  ApplicationRunningUseCaseSpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain


final class CardFetchUseCaseMock: ApplicationRunningUseCase, CardsUseCase {
    
    var shouldFail =  false
    var sentCards = MockValues.cardMockArray
    
    func fetchSets(handler: @escaping (Result<[MetaCardSet]>) -> ()) {
        let result = self.shouldFail ? Result<[MetaCardSet]>.failure(DomainError(errorCode: "", error: ResultErrorMock.error)) : Result<[MetaCardSet]>.success(MockValues.metaCardSetMockArray)
        handler(result)
    }
    
    func fetchCards(from set: MetaCardSet, handler: @escaping (Result<[Card]>) -> ()) {
        let result = self.shouldFail ? Result<[Card]>.failure(DomainError(errorCode: "", error: ResultErrorMock.error)) : Result<[Card]>.success(sentCards)
        handler(result)
    }
    
    func fetchCards(filter name: String, handler: @escaping (Result<[Card]>) -> ()) {
        let result = self.shouldFail ? Result<[Card]>.failure(DomainError(errorCode: "", error: ResultErrorMock.error)) : Result<[Card]>.success(sentCards)
        handler(result)
    }
}
