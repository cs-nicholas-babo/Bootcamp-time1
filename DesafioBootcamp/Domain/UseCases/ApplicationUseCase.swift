//
//  ApplicationUseCase.swift
//  Domain
//
//  Created by g.guimaraes on 15/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public protocol ApplicationStartupUseCase {
    func startupSets(handler: @escaping () -> ())
}

public protocol ApplicationRunningUseCase {
    func fetchSets(handler: @escaping (Result<[MetaCardSet]>) -> ())
//    func upsert(set:MetaCardSet)
}
