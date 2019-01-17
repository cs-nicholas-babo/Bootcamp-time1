//
//  CardSetListViewController.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import GameplayKit

final class CardSetListViewController: UIViewController {
    
    lazy var stateMachine: GKStateMachine = {
        let showCardsState = CardSetListShowCardsState(viewController: self)
        let loadingState = CardSetListLoadingState(viewController: self)
        let errorState = CardSetListErrorState(viewController: self)
        let stateMachine = GKStateMachine(states: [showCardsState, loadingState, errorState])
        return stateMachine
    }()
    
    var interactor: CardSetListBusinessLogic?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        _ = stateMachine.enter(CardSetListLoadingState.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension CardSetListViewController: CardSetListDisplayLogic {
    
    // TODO: Final implementation
    func display(viewModel: CardSetList.ViewModel) {
        _ = stateMachine.enter(CardSetListShowCardsState.self)
    }
    
    func readyToDisplayCards() {
        guard let interactor = interactor else { fatalError() }
        interactor.fetchSet()
    }
    
    // TODO: Final implementation
    func displayError() {
        _ = stateMachine.enter(CardSetListErrorState.self)
    }
    
    
}
