//
//  CardSET.swift
//  Domain
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public typealias CardSet = (set: MetaCardSet, cards: [Card])

public func ==(lhs: CardSet, rhs: CardSet) -> Bool {
    return lhs.set.code == rhs.set.code
        && lhs.cards.count == rhs.cards.count
}

public func ==(lhs: [CardSet], rhs: [CardSet]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    
    var isEqual = true
    
    for index in 0..<lhs.count {
        isEqual = lhs[index] == rhs[index]
    }
    
    return isEqual
}


