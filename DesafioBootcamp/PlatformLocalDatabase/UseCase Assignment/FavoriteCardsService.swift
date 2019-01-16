//
//  FavoriteCardsService.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

public final class FavoriteCardsService: Domain.FavoriteCardsUseCase {
    private let repository: FavoriteCardsRepository
    
    public init(repository: FavoriteCardsRepository){
        self.repository = repository
    }
    
    public func favorite(card: Card, status: Bool) {
        if (status) {
            repository.upsert(object: card)
        } else {
            repository.delete(object: card)
        }
    }

}
