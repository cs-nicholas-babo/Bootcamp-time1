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
    private static var layout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Card.size.width.proportionalToWidth, height: Card.size.height.proportionalToHeight)
        layout.minimumLineSpacing = 16.proportionalToWidth
        
        return layout
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: CardSetListCollectionView.layout)
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
