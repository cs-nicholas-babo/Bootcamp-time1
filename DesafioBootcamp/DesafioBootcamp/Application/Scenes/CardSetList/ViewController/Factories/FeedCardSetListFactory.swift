//
//  FeedCardSetListFactory.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

final class FeedCardSetListFactory {
    
    static func make() -> UIViewController {
        let viewController = FeedCardSetListViewController()
        let presenter = CardSetListPresenter(viewController: viewController)
        let interactor = CardSetListInteractor(presenter: presenter, cardGateway: makeMTGCardGateway())
        viewController.interactor = interactor
        
        return viewController
    }
    
    static func makeMTGCardGateway() -> MTGSetFetcher {
        let localDatabaseGateway = APIGatewayFactory.make()
        return localDatabaseGateway
    }
}
