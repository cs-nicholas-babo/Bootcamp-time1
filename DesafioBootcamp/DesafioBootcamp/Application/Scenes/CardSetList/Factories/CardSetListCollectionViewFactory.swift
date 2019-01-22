//
//  CardSetListCollectionViewFactory.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import Domain

class CardSetListCollectionViewFactory {
    static func make(cards: [Card]) -> UICollectionView {
        let dataSource = CardSetListCollectionViewDataSource(cards: cards)
        let collectionView = CardSetListCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        return collectionView
}
    
    private static var layout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Card.size.width.proportionalToWidth, height: Card.size.height.proportionalToHeight)
        layout.minimumLineSpacing = 16.proportionalToWidth
        
        return layout
    }
}
