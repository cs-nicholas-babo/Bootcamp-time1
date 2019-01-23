//
//  ImageDownloader.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

public class ImageDownloader {
    static func setMagicCard(with url: URL?, imageView: inout UIImageView){
        imageView.kf.indicatorType = .activity
        (imageView.kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "Card_Background"))
    }
}
