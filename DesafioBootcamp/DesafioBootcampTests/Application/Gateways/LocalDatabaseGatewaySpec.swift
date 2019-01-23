//
//  LocalDatabaseGatewaySpec.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import DesafioBootcamp

final class LocalDatabaseGatewaySpec: QuickSpec {
    override func spec() {
        describe("LocalDatabaseGatewaySpec") {
            var sut: LocalDatabaseGateway!
            
            context("when initialized") {
                var favoriteCardsService: FavoriteCardsUseCaseMock!
                var cacheService: ApplicationRunningUseCaseMock!
                
                beforeEach {
                    favoriteCardsService = FavoriteCardsUseCaseMock()
                    cacheService = ApplicationRunningUseCaseMock()
                    sut = LocalDatabaseGateway()
                    sut.service = favoriteCardsService
                    sut.cacheService = cacheService
                }
            }
        }
    }
}
