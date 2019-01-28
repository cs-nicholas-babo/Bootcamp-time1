//
//  MockValue.swift
//  DesafioBootcampUITests
//
//  Created by ricardo.s.rachaus on 28/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
@testable import DesafioBootcamp

typealias TypedCards = (type: CardType, cards: [Card])

struct MockValue {
    static let metaCardSetMock = MetaCardSet(code: "setCode", name: "setName", releaseDate: Date())
    
    static let metaCardSetMockArray = [metaCardSetMock, metaCardSetMock, metaCardSetMock, metaCardSetMock, metaCardSetMock]
    
    static let cardMock = Card(id: "id", name: "name", setCode: "setCode", types: [CardType(name: "type1"), CardType(name: "type2")])
    
    static let cardMockArray = [cardMock, cardMock, cardMock, cardMock, cardMock]
    
    static let cardSetMock = (set: metaCardSetMock, cards: cardMockArray)
    
    static let cardSetMockArray: [CardSet] = [cardSetMock, cardSetMock, cardSetMock, cardSetMock, cardSetMock]
    
    static let viewModelMock = CardSetList.ViewModel(cardSet: cardSetMock)
    
    static let favoriteStatusMock = true
    
    static let searchBarTextMock = "Search"
    
    static let selectedIndexMock = 0
    
    static let subsetMock = ModalDetail.ViewModel.Subset(cards: [cardMock], selectedIndex: selectedIndexMock)
    
    static let cardType = CardType(name: "type1")
    
    static let typedCards: TypedCards = (type: cardType, cards: cardMockArray)
}
