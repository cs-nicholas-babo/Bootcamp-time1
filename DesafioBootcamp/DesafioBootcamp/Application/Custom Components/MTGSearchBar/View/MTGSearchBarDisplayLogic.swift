//
//  MTGSearchBarDisplayLogic.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol MTGSearchBarDisplayLogic : class {
    func display(sets: [CardSet])
}
