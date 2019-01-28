//
//  CardSetListCollectionWrapperView.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import Domain

class CardSetListCollectionWrapperView: UIView {
    
    lazy var collectionView:CardSetListCollectionView = {
        let collectionView = CardSetListCollectionView(frame: .zero)
        return collectionView
    }()
    
    let datasource = CardSetListCollectionViewDataSource()
    let delegate: CardSetListCollectionViewDelegate
    
    override init(frame: CGRect) {
        
        self.delegate = CardSetListCollectionViewDelegate(datasource: datasource)
        super.init(frame: frame)
        self.collectionView.dataSource = self.datasource
        self.collectionView.delegate = delegate
        datasource.collection = collectionView
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationDelegate(delegate: NavigationDelegate?){
        self.delegate.navigationDelegate = delegate
    }
}

extension CardSetListCollectionWrapperView: ViewCode {
    
    func setupViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
