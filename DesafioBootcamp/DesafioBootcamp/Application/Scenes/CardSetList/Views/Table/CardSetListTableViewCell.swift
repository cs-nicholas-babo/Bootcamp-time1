//
//  CardSetListTableViewCell.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

class CardSetListTableViewCell: UITableViewCell {
    
    lazy var collectionWrapperView: CardSetListCollectionWrapperView = {
        let wrapper = CardSetListCollectionWrapperView(frame: self.frame)
        return wrapper
    }()
    
}

extension CardSetListTableViewCell: ViewCode{
    
    func setupViewHierarchy() {
        addSubview(collectionWrapperView)
    }
    
    func setupConstraints() {
        collectionWrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
