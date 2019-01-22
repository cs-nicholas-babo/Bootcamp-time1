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

public class ModalDetailViewController: UIViewController {
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
        return imageView
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "Close"), for: .normal)
        return button
    }()
    
    lazy var cardView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "Card_Background")
        return imageView
    }()
    
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
        backgroundImage.addSubview(cardView)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalTo(ModalDetail.LayoutGuide.dismissButtonSide)
            make.height.equalTo(dismissButton.snp.width)
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        }
        
        cardView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(ModalDetail.LayoutGuide.sideProportion)
            make.height.equalTo(cardView.snp.width).multipliedBy(MagicCard.proportionYX)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.view.backgroundColor = .white
    }

}

extension ModalDetailViewController: ModalDetailDisplayLogic {
    func display(viewModel: ModalDetail.ViewModel) {
        ImageDownloader.setMagicCard(with: viewModel.card.literalImageURL(), imageView: &cardView)
    }
    
}
