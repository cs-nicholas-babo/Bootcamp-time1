//
//  CardSET.swift
//  Domain
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public typealias CardSet = (set: MetaCardSet, cards: [Card])

func ==(lhs: CardSet, rhs: CardSet) -> Bool {
    return lhs.set.code == rhs.set.code
        && lhs.cards.count == rhs.cards.count
}
