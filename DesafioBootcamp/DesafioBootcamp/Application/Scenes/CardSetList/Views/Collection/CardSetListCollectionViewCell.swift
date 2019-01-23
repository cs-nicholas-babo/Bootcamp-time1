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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(fromPath path: String) {
        self.imageView.kf.setImage(with: URL(string: path))
    }
    
    static func size(for width: CGFloat) -> CGSize{
        let ratio:CGFloat = 118/85
        return CGSize(width: width, height: width * ratio)
    }
}

extension CardSetListCollectionViewCell: ViewCode {
    func setupViewHierarchy() {
        addSubview(self.imageView)
    }
    
    func setupConstraints() {
        self.imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
    }
    
    
}
