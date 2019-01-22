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
    
    static let iPhoneSEWidth: CGFloat = 320
    static let iPhoneSEHeight: CGFloat = 568
    
    static let statusBarHeight: CGFloat = 22
    
    static var widthProportion: CGFloat { return main.bounds.width/iPhoneSEWidth }
    static var heightProportion: CGFloat { return main.bounds.height/iPhoneSEHeight }
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
