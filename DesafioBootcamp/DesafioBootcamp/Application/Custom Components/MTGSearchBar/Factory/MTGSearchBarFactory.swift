//
//  MTGSearchBarFactory.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import PlatformAPI
import PlatformLocalDatabase

final class MTGSearchBarFactory {
    static func feed(vc: UIViewController) -> MTGSearchBar {
        let view = MTGSearchBar(frame: .zero)
        let presenter = MTGSearchBarPresenter(viewController: view)
        let interactor = MTGSearchBarInteractor(applicationUseCase: applicationServiceAPI(), cardsUseCase: cardsUseServiceAPI(), presenter: presenter)
        view.interactor = interactor
        return view
    }
    
//    static func favorites() -> MTGSearchBar {
//        let view = MTGSearchBar(frame: .zero)
//        let presenter = MTGSearchBarPresenter(viewController: view)
//        let interactor = MTGSearchBarInteractor(applicationUseCase: applicationFavorites(), cardsUseCase: cardsUseFavorites(), presenter: presenter)
//
//        view.interactor = interactor
//    }
    
    
    private static func applicationServiceAPI() -> ApplicationRunningUseCase {
        return MTG_ProviderDefault().applicationRunningUseCase()
    }
    
    private static func cardsUseServiceAPI() -> CardsUseCase {
        return MTG_ProviderDefault().cardsUseCase()
    }
    
//    private static func applicationFavorites() -> ApplicationRunningUseCase {
//        return CacheServiceProvider().useCase()
//    }
//
//    private static func cardsUseFavorites() -> CardsUseCase {
//        return FavoriteCardsServiceProvider().useCase()
//    }
    
    
}
