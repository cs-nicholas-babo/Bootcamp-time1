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
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let card = Card(id: "1", name: "o0i", setCode: "10E", types: Set<CardType>(), imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card")
        
        MTG_ProviderDefault().applicationStartupUseCase().startup {
            let modalVC = ModalDetailViewController()
            let presenter = ModalDetailPresenter(viewController: modalVC)
            let router = ModalDetailRouter(viewController: modalVC)
            let interactor = ModalDetailInteractor(presenter: presenter, useCase: FavoriteCardsServiceProvider().useCase(), card: card, status: false)
            modalVC.interactor = interactor
            modalVC.router = router
            
            window.rootViewController = modalVC
            
            self.window = window
            self.window?.makeKeyAndVisible()
            
        }
        
        
        return true
    }

}

