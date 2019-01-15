//
//  UseCaseProviders.swift
//  Domain
//
//  Created by g.guimaraes on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public protocol ApplicationStartupUseCaseProvider {
    func useCase() -> ApplicationStartupUseCase
}

public protocol ApplicationRunningUseCaseProvider {
    func useCase() -> ApplicationRunningUseCase
}

public protocol CardsUseCaseProvider {
    func useCase() -> CardsUseCase
}

public protocol FavoritesUseCaseProvider {
    func useCase() -> FavoritesUseCase
}
