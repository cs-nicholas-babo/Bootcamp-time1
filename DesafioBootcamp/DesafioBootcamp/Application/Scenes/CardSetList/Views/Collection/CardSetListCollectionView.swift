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
        let spacing:CGFloat = 16.0
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        layout.scrollDirection = .vertical
        return layout
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: CardSetListCollectionView.layout)
        self.collectionViewLayout = CardSetListCollectionView.layout
        setupView()
        self.isScrollEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardSetListCollectionView: ViewCode {
    func setupViewHierarchy() {}
    
    func setupConstraints() {}
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor.clear
        register(CardSetListCollectionViewCell.self,
                 forCellWithReuseIdentifier: CardSetList.collectionViewCellIdentifier)
        register(CardTypeCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
    }
    
    
}
