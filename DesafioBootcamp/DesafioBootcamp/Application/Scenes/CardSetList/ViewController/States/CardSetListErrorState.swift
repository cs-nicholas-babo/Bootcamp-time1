//
//  CardSetListErrorState.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import GameplayKit

final class CardSetListErrorState: CardSetListBaseState {
    
    override func didEnter(from previousState: GKState?) {
        print("ErrorState 😈")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        if stateClass == CardSetListLoadingState.self {
            return true
        } else {
            return false
        }
    }
    
}
