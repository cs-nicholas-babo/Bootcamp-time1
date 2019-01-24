//
//  AppDelegate.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 14/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import Domain
import PlatformLocalDatabase
import PlatformAPI



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let card1 = Card(id: "1", name: "o0i", setCode: "10E", types: Set<CardType>(), imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card")
        let card2 = Card(id: "2", name: "o0i", setCode: "10E", types: Set<CardType>(), imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card")
        let card3 = Card(id: "3", name: "o0i", setCode: "10E", types: Set<CardType>(), imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card")
        
        MTG_ProviderDefault().applicationStartupUseCase().startup {
            let tabBarController = MTGTabBarController()
            let modalVC = ModalDetailViewController()
            let presenter = ModalDetailPresenter(viewController: modalVC)
            let router = ModalDetailRouter(viewController: modalVC)
            let viewModel = ModalDetail.ViewModel.Subset(cards: [card1, card2, card3], selectedIndex: 1)
            let interactor = ModalDetailInteractor(presenter: presenter,
                                                   useCase: FavoriteCardsServiceProvider().useCase(),
                                                   subset: viewModel)
            modalVC.interactor = interactor
            modalVC.router = router
            
            tabBarController.viewControllers = [modalVC]
            window.rootViewController = tabBarController
            self.window = window
            self.window?.makeKeyAndVisible()
            
        }
        
        
        return true
    }

}

