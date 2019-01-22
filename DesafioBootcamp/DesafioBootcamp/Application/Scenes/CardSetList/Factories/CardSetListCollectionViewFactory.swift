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
        let dataSource = CardSetListCollectionViewDataSource()
        let collectionView = CardSetListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = dataSource
        return collectionView
    }
}
