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
    
    lazy var wrapperView: CardSetListTableWrapperView = {
       return CardSetListTableWrapperView(frame: self.view.frame)
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        _ = stateMachine.enter(CardSetListLoadingState.self)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension CardSetListViewController: CardSetListDisplayLogic {
    
    func display(viewModel: CardSetList.ViewModel) {
        _ = stateMachine.enter(CardSetListShowCardsState.self)
        self.wrapperView.datasource.sets.append(viewModel)
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

extension CardSetListViewController: ViewCode {
    func setupAdditionalConfiguration() {
        
    }
    
    func setupViewHierarchy() {
        self.view.addSubview(self.wrapperView)
    }
    
    func setupConstraints() {
        self.wrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
