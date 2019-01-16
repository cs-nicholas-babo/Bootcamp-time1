//
//  MTGService.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

protocol MTGService{
    
    func fetchSimpleSets()
    func fetchCards()
    
    func fetchSets()
    
}

extension MTGService{
    
    func fetchSets(){
        fetchSimpleSets()
        fetchCards()
    }
    
}
