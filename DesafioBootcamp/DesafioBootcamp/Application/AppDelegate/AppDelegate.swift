//
//  AppDelegate.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 14/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import CoreData
import Domain
import PlatformLocalDatabase
import Realm
import RealmSwift
import PlatformAPI



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupInitialState()
        
        return true
    }
    
    func setupInitialState(){
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = MTGTabBarController()
        
        let service = MTG_ProviderDefault().applicationStartupUseCase()
        service.startup {}
        let favoriteCardsVC = FavoritesCardSetListFactory.make()
        favoriteCardsVC.title = "Favorites"
        let apiCardsVC = FeedCardSetListFactory.make()
        apiCardsVC.title = "Cards"
        
        tabBarController.viewControllers = [apiCardsVC, favoriteCardsVC]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}

