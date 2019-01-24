//
//  CardSetListModel.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

typealias TypedCards = (type: CardType, cards: [Card])

enum CardSetList {
    
    enum Response {
        case success([CardSet])
        case readyToPresentSets
        case error
    }
    
    struct ViewModel {
        var setName: String
        private(set) var typedCards: [TypedCards]
        
        /**
         Initialize instance with CardSet passed.
         
         - parameters:
            - cardSet: Set with cards to be displayed.
         */
        init(cardSet: CardSet) {
            self.setName = cardSet.set.name
            
            var typeSortedCards: [TypedCards] = []
            let types = cardSet.cards.flatMap { $0.types }
            let sortedTypes = Set<CardType>(types).sorted { $0.name < $1.name }
            sortedTypes.forEach { cardType in
                let cards = cardSet.cards.filter { $0.types.contains(cardType) }
                typeSortedCards.append(TypedCards(cardType, cards))
            }
            
            self.typedCards = typeSortedCards
        }
        
        mutating func update(cards: [TypedCards]){
            self.typedCards = cards
        }
    }
    
    static let collectionViewCellIdentifier = "CollectionViewCellIdentifier"
    static let tableViewCellIdentifier = "TableViewCellIdentifier"
}


extension CardSetList.ViewModel: Equatable {
    static func == (lhs: CardSetList.ViewModel, rhs: CardSetList.ViewModel) -> Bool {
        return lhs.setName == rhs.setName
    }
}
