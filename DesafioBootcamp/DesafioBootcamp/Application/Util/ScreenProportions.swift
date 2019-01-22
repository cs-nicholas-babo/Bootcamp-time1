//
//  ScreenProportions.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

extension UIScreen {
    
    static let iPhone6Width: CGFloat = 375
    static let iPhone6Height: CGFloat = 667
    
    static var widthProportion: CGFloat { return main.bounds.width/iPhone6Width }
    
    static var heightProportion: CGFloat { return main.bounds.height/iPhone6Height }
}

extension CGFloat {
    
    var proportionalToWidth: CGFloat {
        return self * UIScreen.widthProportion
    }
    
    var proportionalToHeight: CGFloat {
        
        return self * UIScreen.heightProportion
    }
}

extension Double {
    var proportionalToWidth: CGFloat {
        return CGFloat(self) * UIScreen.widthProportion
    }
    
    var proportionalToHeight: CGFloat {
        
        return CGFloat(self) * UIScreen.heightProportion
    }
}

extension Int {
    var proportionalToWidth: CGFloat {
        return CGFloat(self) * UIScreen.widthProportion
    }
    
    var proportionalToHeight: CGFloat {
        return CGFloat(self) * UIScreen.heightProportion
    }
}
