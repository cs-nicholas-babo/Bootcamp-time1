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
    var cards = [Card]() {
        didSet {
            print("hue")
        }
    }
}

extension CardSetListCollectionView {
    
}

extension CardSetListCollectionView: ViewCode {
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
