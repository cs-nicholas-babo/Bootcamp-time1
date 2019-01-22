//
//  MTGService.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol MTGCardGateway {
    func fetchSet(of: MetaCardSet, _ completion: @escaping (Result<CardSet>) -> Void)
    func fetchCards(named: String, _ completion: @escaping (Result<[Card]>) -> Void)
}
