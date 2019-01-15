//
//  FavoritesUseCase.swift
//  Domain
//
//  Created by g.guimaraes on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public protocol FavoritesUseCase {
    func favorite(card: Card, status: Bool)
}
