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
    static let metaCardSetMock = MetaCardSet(code: "setCode", name: "setName", releaseDate: Date())
    
    static let metaCardSetsMock = [metaCardSetMock, metaCardSetMock, metaCardSetMock, metaCardSetMock, metaCardSetMock]
    
    static let cardMock = Card(id: "id", name: "name", setCode: "setCode", types: [CardType(name: "type1"), CardType(name: "type2")])
    
    static let cardsMock = [cardMock, cardMock, cardMock, cardMock, cardMock]
    
    static let cardSetMock = (set: metaCardSetMock, cards: cardsMock)
    
    static let viewModelMock = CardSetList.ViewModel(cardSet: cardSetMock)
    
    static let favoriteStatusMock = true
    
    static let searchBarTextMock = "Search"
}
