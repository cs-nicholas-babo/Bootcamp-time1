//
//  MockValues.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

@testable import DesafioBootcamp

struct MockValues {
    static let metaCardSet = MetaCardSet(code: "setCode", name: "setName", releaseDate: Date())
    
    static let metaCardSetArray = [metaCardSet, metaCardSet, metaCardSet, metaCardSet, metaCardSet]
    
    static let card = Card(id: "id", name: "name", setCode: "setCode", types: [CardType(name: "type1"), CardType(name: "type2")])
    
    static let cardArray = [card, card, card, card, card]
    
    static let cardSet = (set: metaCardSet, cards: cardArray)
    
    static let cardSetArray: [CardSet] = [cardSet, cardSet, cardSet, cardSet, cardSet]
    
    static let viewModel = CardSetList.ViewModel(cardSet: cardSet)
    
    static let favoriteStatus = true
    
    static let searchBarText = "Search"
    
    static let selectedIndex = 0
    
    static let subset = ModalDetail.ViewModel.Subset(cards: [card], selectedIndex: selectedIndex)
}
