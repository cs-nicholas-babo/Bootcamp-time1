//
//  CardSetListCollectionView.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import Domain

class CardSetListCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardSetListCollectionView: ViewCode {
    func setupViewHierarchy() {}
    
    func setupConstraints() {}
    
    func setupAdditionalConfiguration() {
        register(CardSetListCollectionViewCell.self,
                 forCellWithReuseIdentifier: CardSetList.collectionViewCellIdentifier)
    }
    
    
}
