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
    
    lazy var errorImageView: UIImageView = {
        let imageView = UIImageView(image: Image.error)
        return imageView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return activity
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ = stateMachine.enter(CardSetListLoadingState.self)
    }
}

extension CardSetListViewController: CardSetListDisplayLogic {
    
    func display(viewModel: CardSetList.ViewModel) {
        _ = stateMachine.enter(CardSetListShowCardsState.self)
        self.wrapperView.datasource.sets.append(viewModel)
        self.wrapperView.tableView.reloadData()
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
    
    func setupViewHierarchy() {
        self.view.addSubview(self.wrapperView)
        self.view.addSubview(self.errorImageView)
        self.view.addSubview(self.activityIndicator)
    }
    
    func setupConstraints() {
        self.wrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.errorImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        
        self.activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
    }
    
    func setupAdditionalConfiguration() {
        errorImageView.isHidden = true
        activityIndicator.isHidden = true
        wrapperView.isHidden = true
    }
}
