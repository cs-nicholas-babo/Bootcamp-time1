//
//  CardSetListCollectionViewCell.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class CardSetListCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white
        return imageView
    }()
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(fromPath path: String) {
        self.imageView.kf.setImage(with: URL(string: path), placeholder: Image.placeholder)
    }
    
    static func size(for width: CGFloat) -> CGSize{
        let ratio:CGFloat = 118/85
        return CGSize(width: width, height: width * ratio)
    }
    
    
}

extension CardSetListCollectionViewCell: ViewCode {
    func setupViewHierarchy() {
        self.contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        let spacing:CGFloat = 16.0
        let numberOfItemsPerRow:CGFloat = 3
        let totalSpacing:CGFloat = (numberOfItemsPerRow + 1) * spacing + 2.0
        let cellWidth = (UIScreen.main.bounds.width - totalSpacing)/numberOfItemsPerRow
        
        
        self.imageView.snp.makeConstraints { make in
            make.width.equalTo(cellWidth)
            make.height.equalTo(CardSetListCollectionViewCell.size(for: cellWidth))
            make.center.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() { }
    
    
}
