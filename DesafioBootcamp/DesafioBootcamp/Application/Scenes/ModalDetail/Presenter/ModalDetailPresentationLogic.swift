//
//  ModalDetailPresentationLogic.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol ModalDetailPresentationLogic {
    func show(cards: [Card], selectedIndex: Int)
    func refreshButton(status: Bool)
}
