//
//  SetListPresenter.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

protocol CardSetListPresentationLogic {
    func present(response: CardSetList.Response)
}
