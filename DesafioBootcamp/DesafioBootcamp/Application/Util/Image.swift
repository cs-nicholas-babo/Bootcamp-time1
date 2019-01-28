//
//  Image.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

struct Image{
    
    static var error: UIImage{
        return UIImage(named: "Group") ?? UIImage()
    }
    
    static var placeholder: UIImage{
        return UIImage(named: "Card_Background") ?? UIImage()
    }
    
    static var background: UIImage{
        return UIImage(named: "Background") ?? UIImage()
    }
    
    static var noResults: UIImage{
        return UIImage(named: "noResults") ?? UIImage()
    }
}
