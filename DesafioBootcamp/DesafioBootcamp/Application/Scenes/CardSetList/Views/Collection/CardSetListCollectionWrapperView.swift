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

}

extension CardSetListCollectionWrapperView: ViewCode{
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

extension CardSetListCollectionWrapperView: DataFeeder{
    typealias FeedData = [Card]
    
    func feed(data: [Card]) {
        self.datasource.set(cards: data)
    }
}
