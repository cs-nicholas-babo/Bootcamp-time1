//
//  MockValues.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

struct MockValues {
    static let metaCardSetMock = MetaCardSet(code: "setCode", name: "setName")
    
    static let metaCardSetsMock = [metaCardSetMock, metaCardSetMock, metaCardSetMock, metaCardSetMock, metaCardSetMock]
    
    static let cardMock = Card(id: "id", name: "name", setCode: "setCode", types: [CardType(name: "type1"), CardType(name: "type1")])
    
    static let cardsMock = [cardMock, cardMock, cardMock, cardMock, cardMock]
    
    static let cardSetMock = (set: metaCardSetMock, cards: cardsMock)
}
