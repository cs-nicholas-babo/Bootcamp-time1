//
//  EntityManager.swift
//  Domain
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public class CardManipulator {
    public static func filterCards(from metaCardSet: MetaCardSet, using cards: [Card]) -> [Card] {
        return cards.filter({ $0.setCode == metaCardSet.code }) /* COULD BE IMPROVED */
    }
    
    public static func mountCardSet(from metaCardSet: MetaCardSet, using cards: [Card]) -> CardSet {
        return CardSet(set: metaCardSet, cards: self.filterCards(from: metaCardSet, using: cards))
    }
    
    public static func mountCardSets(from metaCardSets: [MetaCardSet], using cards: [Card]) -> [CardSet]{
        return metaCardSets.map({ mountCardSet(from: $0, using: cards) })
    }
    
    public init(){
        
    }
}
