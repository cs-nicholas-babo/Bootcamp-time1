//
//  MTGCardViewPicker.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

final class MTGCardViewPicker: UIView {
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
}

extension MTGCardViewPicker: ViewCode {
    func setupViewHierarchy() {
        self.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.snp.height).multipliedBy(MagicCard.proportionXY)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }

}
