//
//  MTGSearchBarPresenter.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

final class MTGSearchBarPresenter {
    unowned var viewController: MTGSearchBarDisplayLogic
    
    init(viewController: MTGSearchBarDisplayLogic) {
        self.viewController = viewController
    }
        
}

extension MTGSearchBarPresenter: MTGSearchBarPresentationLogic {
    func send(sets: [CardSet]) {
        self.viewController.display(sets: sets)
    }
    
}
