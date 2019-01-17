//
//  CardSetListBaseState.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import GameplayKit

class CardSetListBaseState: GKState {
    
    let viewController: CardSetListViewController
    
    init(viewController: CardSetListViewController) {
        self.viewController = viewController
    }
    
}
