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
        var typeSortedCards: TypedCards
        
        /**
         Initialize instance with CardSet passed.
         
         - parameters:
            - cardSet: Set with cards to be displayed.
         */
        init(cardSet: CardSet) {
            typeSortedCards = [:]
            let types = cardSet.cards.flatMap { $0.types }
            let sortedTypes = Set<CardType>(types).sorted { $0.name < $1.name }
            sortedTypes.forEach { (cardType) in
                let cards = cardSet.cards.filter { $0.types.contains(cardType) }
                typeSortedCards.updateValue(cards, forKey: cardType)
            }
        }
    }
}
