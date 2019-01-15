//
//  CardsUseCase.swift
//  Domain
//
//  Created by g.guimaraes on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public protocol CardsUseCase {
    func fetchCards(from set: CardSet, handler: @escaping (Result<[Card]>) -> ())
    func fetchCards(filter name: String, handler: @escaping (Result<[Card]>) -> ())
}
