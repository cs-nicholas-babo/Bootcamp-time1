//
//  CardSetListCollectionViewDataSource.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import Domain

class CardSetListCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    var cards: [TypedCards] = []
    
    override init() {
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards[section].cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardSetList.collectionViewCellIdentifier,
                                                      for: indexPath) as! CardSetListCollectionViewCell
        if let path = cards[indexPath.section].cards[indexPath.row].imageURL {
            cell.loadImage(fromPath: path)
        }else{
            cell.imageView.image = Image.placeholder
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! CardTypeCollectionReusableView
            view.backgroundColor = UIColor.clear
            view.title.text = cards[indexPath.section].type.name
            
            return view
        }else{
            return UICollectionReusableView()
        }
    }
}
