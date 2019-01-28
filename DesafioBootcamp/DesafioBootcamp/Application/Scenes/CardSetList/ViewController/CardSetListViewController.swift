//
//  CardSetListViewController.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import GameplayKit

class CardSetListViewController: UIViewController {
    
    lazy var stateMachine: GKStateMachine = {
        let showCardsState = CardSetListShowCardsState(viewController: self)
        let loadingState = CardSetListLoadingState(viewController: self)
        let errorState = CardSetListErrorState(viewController: self)
        let noResultsState = CardSetListNoResultsState(viewController: self)
        let stateMachine = GKStateMachine(states: [showCardsState, loadingState, errorState, noResultsState])
        return stateMachine
    }()
    
    var interactor: CardSetListBusinessLogic?
    var hasLoaded = false
    
    lazy var wrapperView: CardSetListTableWrapperView = {
        let wrapper = CardSetListTableWrapperView(frame: self.view.frame)
        wrapper.setupNavigationDelegate(delegate: self)
       return wrapper
    }()
    
    lazy var errorImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return activity
    }()
    
    lazy var searchBar: MTGSearchBar = {
        let searchBar = MTGSearchBarFactory.feed(vc: self)
        return searchBar
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !hasLoaded {
            initialSetup()
        } else {/*donot*/}
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    func initialSetup() {
        _ = stateMachine.enter(CardSetListLoadingState.self)
        self.hasLoaded = true
    }
}

extension CardSetListViewController: CardSetListDisplayLogic {
    
    func display(viewModel: CardSetList.ViewModel) {
        _ = stateMachine.enter(CardSetListShowCardsState.self)
        self.wrapperView.datasource.smartAppend(model: viewModel)
//        var count = 0
//        self.wrapperView.datasource.sets.forEach { (model) in
//            model.typedCards.forEach({ (type, cards) in
//                count = count + cards.count
//            })
//        }
//        self.wrapperView.tableView.reloadData()
    }
    
    func displaySearchResults(viewModel: [CardSetList.ViewModel]){
        _ = stateMachine.enter(CardSetListShowCardsState.self)
        self.wrapperView.datasource.sets = viewModel
        self.wrapperView.tableView.reloadData()
    }
    
    func displayNoResults(){
        _ = stateMachine.enter(CardSetListNoResultsState.self)
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
        self.view.addSubview(self.searchBar)
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
        
        self.searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    func setupAdditionalConfiguration() {
        errorImageView.isHidden = true
        activityIndicator.isHidden = true
        wrapperView.isHidden = true
        wrapperView.navigationDelegate = self
    }
}

extension CardSetListViewController: NavigationDelegate{
    func push(controller: UIViewController) {
//        self.navigationController?.pushViewController(controller, animated: true)
        self.present(controller, animated: true, completion: nil)
    }
}
