//
//  ArgumentFile.swift
//  Domain
//
//  Created by g.guimaraes on 14/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

/*

    USE CASES
 
    APPLICATION
        * STARTUP
        - startup(handler: () -> ())
 
        * GENERAL
        - fetchSets() -> [CardSet]
 
    MODULE CARDS
    - fetchCards(from: CardSet) -> [Card]
    - fetchCards(from name: String) -> [Card]
 
    MODULE MODAL PREVIEW
    - favorite(card: Card, status: Bool)
 
*/
