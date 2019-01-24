//
//  ModalDetail.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import CoreGraphics

enum ModalDetail {
    struct Request {
        var subset: [Card]
        var indexPath: IndexPath
    }
    
    struct Response {
        
    }
    
    struct LayoutGuide {
        static let dismissButtonSide: CGFloat = 44.proportionalToWidth
        static let sideProportion: CGFloat = UIScreen.main.bounds.width*0.14
        static let defaultFavoriteMargin: CGFloat = 16
        static let favoriteButtonHeight: CGFloat = 48.proportionalToHeight
    }
    
    struct ViewModel {
        struct Single {
            let card: Card
            let status: Bool
        }
        
        struct Subset {
            let cards: [Card]
            let selectedIndex: Int
        }
    }
    
}

