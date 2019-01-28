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
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionWrapperView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: CGFloat(MAXFLOAT))
        self.collectionWrapperView.collectionView.layoutIfNeeded()
        
        return collectionWrapperView.collectionView.contentSize
    }
}

extension CardSetListTableViewCell: ViewCode{
    
    func setupViewHierarchy() {
        self.contentView.addSubview(collectionWrapperView)
    }
    
    func setupConstraints() {
        collectionWrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor.clear
    }
}
