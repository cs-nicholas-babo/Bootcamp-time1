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
    var navigationDelegate: NavigationDelegate?
    
    init(datasource: CardSetListCollectionViewDataSource){
        self.datasource = datasource
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing:CGFloat = 16.0 
        let numberOfItemsPerRow:CGFloat = 3
        let totalSpacing:CGFloat = (numberOfItemsPerRow + 1) * spacing + 2.0 //magia
        let cellWidth = (UIScreen.main.bounds.width - totalSpacing)/numberOfItemsPerRow
        
        return CardSetListCollectionViewCell.size(for: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = datasource.cards[indexPath.section].cards[indexPath.item]
        navigationDelegate?.push(controller: ModalViewControllerFactory.make(card: card))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
