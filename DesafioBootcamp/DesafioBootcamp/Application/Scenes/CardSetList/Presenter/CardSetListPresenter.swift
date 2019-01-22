//
//  CardSetListPresenter.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

final class CardSetListPresenter {
    private weak var viewController: CardSetListDisplayLogic!
    
    init(viewController: CardSetListDisplayLogic) {
        self.viewController = viewController
    }
}

extension CardSetListPresenter: CardSetListPresentationLogic {
    func present(response: CardSetList.Response) {
        switch response {
        case .success(let cardSet):
            for set in cardSet {
                let viewModel = CardSetList.ViewModel(cardSet: set)
                viewController.display(viewModel: viewModel)
            }
        case .readyToPresentSets:
            viewController.readyToDisplayCards()
        case .error:
            viewController.displayError()
        }
    }
    
}
