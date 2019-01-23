//
//  MTGService.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol MTGSetFetcher {
    func fetchSets(_ completion: @escaping (Result<[CardSet]>) -> Void)
}
