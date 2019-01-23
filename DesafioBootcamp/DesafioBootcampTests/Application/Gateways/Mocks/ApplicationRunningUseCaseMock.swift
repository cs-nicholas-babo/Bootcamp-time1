//
//  ApplicationRunningUseCaseSpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Domain


final class ApplicationRunningUseCaseMock: ApplicationRunningUseCase {
    var shouldFail =  false
    
    func fetchSets(handler: @escaping (Result<[MetaCardSet]>) -> ()) {
        let result = self.shouldFail ? Result<[MetaCardSet]>.failure(DomainError(errorCode: "", error: ResultErrorMock.error)) : Result<[MetaCardSet]>.success(MockValues.metaCardSetMockArray)
        handler(result)
    }
}
