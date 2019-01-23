//
//  CardSetListCollectionViewDelegate.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

final class CardSetListCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let datasource: CardSetListCollectionViewDataSource
    
    init(datasource: CardSetListCollectionViewDataSource){
        self.datasource = datasource
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing:CGFloat = 30.0
        let numberOfItemsPerRow:CGFloat = 2
        let totalSpacing:CGFloat = (numberOfItemsPerRow + 1) * spacing
        let cellWidth = (collectionView.frame.width - totalSpacing)/numberOfItemsPerRow
        
        return CardSetListCollectionViewCell.size(for: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(datasource.cards[indexPath.section].cards[indexPath.item].name)
    }
}
