//
//  CardSetListLoadingState.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import GameplayKit

final class CardSetListLoadingState: CardSetListBaseState {
    
    override func didEnter(from previousState: GKState?) {
        print("LoadingState ⏲")
        guard let interactor = self.viewController.interactor else { fatalError() }
        
        interactor.fetchSet()
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }
    
}
