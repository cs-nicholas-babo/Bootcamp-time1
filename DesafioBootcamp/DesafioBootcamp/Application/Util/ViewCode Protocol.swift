//
//  ViewCode Protocol.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

protocol ViewCode{
    func setupViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode{
    
    func setupView(){
        setupViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
}
