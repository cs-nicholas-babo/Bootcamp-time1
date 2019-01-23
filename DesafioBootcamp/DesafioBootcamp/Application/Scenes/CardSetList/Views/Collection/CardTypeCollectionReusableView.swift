//
//  CardTypeCollectionReusableView.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

class CardTypeCollectionReusableView: UICollectionReusableView {
    
    lazy var title:UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CardTypeCollectionReusableView: ViewCode{
    
    func setupViewHierarchy() {
        self.addSubview(title)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
        }
    }
    
    func setupAdditionalConfiguration() {
        title.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.bold)
        title.textColor = UIColor.lightGray
    }
    
    
}
