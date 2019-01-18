//
//  CardSetListShowCardsState.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import GameplayKit

final class CardSetListShowCardsState: CardSetListBaseState {
    
    override func didEnter(from previousState: GKState?) {
        print("ShowsCardsState 🃏")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }
    
}
