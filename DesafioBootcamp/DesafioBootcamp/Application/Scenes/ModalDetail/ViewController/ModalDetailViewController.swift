//
//  ModalDetailViewController.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol ModalDetailDisplayLogic: class {
    func display(viewModel: ModalDetail.ViewModel.Single)
    func display(viewModel: ModalDetail.ViewModel.Subset)
    func displayButton(status: Bool)
}

public class ModalDetailViewController: UIViewController {
    var router: ModalDetailRoutingLogic?
    var interactor: ModalDetailBusinessLogic?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "Background")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "Close"), for: .normal)
        button.addTarget(self, action: #selector(tapDismissButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var cardView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "Card_Background")
        return imageView
    }()
    
    lazy var cardPicker: MTGCardPicker = {
        let cardPicker = MTGCardPicker(frame: .zero)
        
        return cardPicker
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = MTGSearchBar(frame: .zero)
        return searchBar
    }()
    
    lazy var favoriteButton: TogglebleButton = {
        let stateFalse : (UIButton) -> () = { btn in
            btn.backgroundColor = .clear
            btn.setTitleColor(.white, for: .normal)
            btn.setTitle("Favoritar", for: .normal)
        }
        
        let stateTrue : (UIButton) -> () = { btn in
            btn.backgroundColor = .white
            btn.setTitleColor(.black, for: .normal)
            btn.setTitle("Defavoritar", for: .normal)
        }
        
        let button = TogglebleButton(frame: .zero, realState: false, setupFalse: stateFalse, setupTrue: stateTrue)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 2
        button.addTarget(self, action: #selector(tapFavoriteButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc func tapFavoriteButton() {
        interactor?.toggleFavorite()
    }
    
    @objc func tapDismissButton() {
        router?.dismiss()
    }
    
    public override func loadView() {
        super.loadView()
        
        setupView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.show()
    }
}

extension ModalDetailViewController: ViewCode {
    func setupViewHierarchy() {
        self.view.addSubview(backgroundImage)
        backgroundImage.addSubview(dismissButton)
//        backgroundImage.addSubview(cardView)
        backgroundImage.addSubview(cardPicker)
        backgroundImage.addSubview(favoriteButton)
        backgroundImage.addSubview(searchBar)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        }
        
        dismissButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalTo(ModalDetail.LayoutGuide.dismissButtonSide)
            make.height.equalTo(dismissButton.snp.width)
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        }
        
//        cardView.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.left.right.equalToSuperview().inset(ModalDetail.LayoutGuide.sideProportion)
//            make.height.equalTo(cardView.snp.width).multipliedBy(MagicCard.proportionYX)
//        }
        
        cardPicker.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        favoriteButton.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview().inset(ModalDetail.LayoutGuide.defaultFavoriteMargin)
            make.height.equalTo(ModalDetail.LayoutGuide.favoriteButtonHeight)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.view.backgroundColor = .clear
        
    }

}

extension ModalDetailViewController: ModalDetailDisplayLogic {
    func display(viewModel: ModalDetail.ViewModel.Subset) {
        cardPicker.cards = viewModel.cards
        cardPicker.reloadAllComponents()
//        ImageDownloader.setMagicCard(with: viewModel.typedCards.cards[viewModel.selectedIndex].literalImageURL(), imageView: &cardView)
    }
    
    func displayButton(status: Bool) {
        favoriteButton.setRealState(realState: status)
    }
    
    func display(viewModel: ModalDetail.ViewModel.Single) {
        ImageDownloader.setMagicCard(with: viewModel.card.literalImageURL(), imageView: &cardView)
        favoriteButton.setRealState(realState: viewModel.status)
    }
    
}
