//
//  CardSetListFactoryImplementation.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

final class FavoritesCardSetListFactory {
    static func make() -> UIViewController {
        let viewController = FavoritesCardSetListViewController()
        let presenter = CardSetListPresenter(viewController: viewController)
        let interactor = CardSetListInteractor(presenter: presenter, cardGateway: makeMTGCardGateway())
        viewController.interactor = interactor
        viewController.searchBar.observer = interactor
        
        
        return viewController
    }
    
    private static func makeMTGCardGateway() -> MTGSetFetcher {
        let localDatabaseGateway = LocalDatabaseGatewayFactory.make()
        return localDatabaseGateway
    }
}
