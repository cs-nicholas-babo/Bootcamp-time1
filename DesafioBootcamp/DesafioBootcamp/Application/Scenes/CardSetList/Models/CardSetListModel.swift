//
//  CardSetListModel.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

typealias TypedCards = [CardType : [Card]]

enum CardSetList {
    
    enum Response {
        case success(CardSet)
        case readyToPresentSets
        case error
    }
    
    struct ViewModel {
        let typeSortedCards: [TypedCards]
    }
}
