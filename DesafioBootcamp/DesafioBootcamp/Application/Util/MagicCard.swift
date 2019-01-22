//
//  MagicCard.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import CoreGraphics

struct MagicCard {
    static let height: CGFloat = 88
    static let width: CGFloat = 63
    static let proportionYX: CGFloat = { return height/width }()
    static let proportionXY: CGFloat = { return width/height }()
}
