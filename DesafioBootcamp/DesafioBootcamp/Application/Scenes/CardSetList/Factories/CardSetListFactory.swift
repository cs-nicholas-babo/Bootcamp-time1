//
//  CardSetListFactory.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

protocol CardSetListFactory {
    static func makeMTGCardGateway() -> MTGSetFetcher
    static func getType() -> ControllerType
}

extension CardSetListFactory {
    static func make() -> CardSetListViewController {
        let vc = CardSetListViewController(type: getType())
        let presenter = CardSetListPresenter(viewController: vc)
        let interactor = CardSetListInteractor(presenter: presenter, cardGateway: makeMTGCardGateway())
        vc.interactor = interactor
        
        return vc
    }
}
