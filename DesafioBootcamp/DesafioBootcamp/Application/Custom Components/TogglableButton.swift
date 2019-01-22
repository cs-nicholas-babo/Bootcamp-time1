//
//  Togglable+FavoriteButton.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

class TogglebleButton: UIButton {
    private var realState: Bool
    public var setupFalse: (UIButton) -> ()
    public var setupTrue: (UIButton) -> ()
    
    init(frame: CGRect, realState: Bool, setupFalse:  @escaping (UIButton) -> () = { _ in }, setupTrue: @escaping (UIButton) -> () = { _ in }) {
        self.realState = realState
        self.setupFalse = setupFalse
        self.setupTrue = setupTrue
        super.init(frame: frame)
        render()
//        addTarget(self, action: #selector(changeState), for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeState(){
        realState.toggle()
        render()
    }
    
    func render(){
        if realState == true {
            setupTrue(self)
        } else {
            setupFalse(self)
        }
    }
    
    func setRealState(realState: Bool){
        self.realState = realState
        render()
    }
}
