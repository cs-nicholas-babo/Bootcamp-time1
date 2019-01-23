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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
//        mockupFavorites()
        let tabBarController = UITabBarController()
        let favoriteCardsVC = FavoritesCardSetListFactory.make()
        favoriteCardsVC.title = "Favorites"
        let apiCardsVC = FeedCardSetListFactory.make()
        apiCardsVC.title = "Cards"
        
        tabBarController.viewControllers = [apiCardsVC, favoriteCardsVC]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
    func mockupFavorites(){
        let type1 = CardType(name: "Criatura")
        let type2 = CardType(name: "Terreno")
        let card1 = Card(id: "1", name: "card1", setCode: "111", types: [type1])
        let card11 = Card(id: "11", name: "card11", setCode: "111", types: [type1])
        let card111 = Card(id: "111", name: "card111", setCode: "111", types: [type1])
        let card1111 = Card(id: "1111", name: "card1111", setCode: "111", types: [type1])
        let card2 = Card(id: "2", name: "card2", setCode: "111", types: [type2])
        let card22 = Card(id: "22", name: "card22", setCode: "111", types: [type2])
        let card3 = Card(id: "3", name: "card3", setCode: "222", types: [type2])
        let card4 = Card(id: "4", name: "card4", setCode: "222", types: [type2])
        let card5 = Card(id: "5", name: "card5", setCode: "222", types: [type1, type2])
        
        let set1 = MetaCardSet(code: "111", name: "Set 1", releaseDate: Date())
        let set2 = MetaCardSet(code: "222", name: "Set 2", releaseDate: Date())
        
        let realm = try! Realm()
        let repo = FavoriteCardsRepository(realm: realm)
        let manager = CacheManager(realm: realm)
        let favoriteService = FavoriteCardsService(repository: repo, manager: manager)
        let service = CacheService(cacheManager: manager)
        
        service.favorite(set: set1)
        service.favorite(set: set2)
        
        favoriteService.favorite(card: card1, status: true)
        favoriteService.favorite(card: card11, status: true)
        favoriteService.favorite(card: card111, status: true)
        favoriteService.favorite(card: card1111, status: true)
        favoriteService.favorite(card: card2, status: true)
        favoriteService.favorite(card: card22, status: true)
        favoriteService.favorite(card: card3, status: true)
        favoriteService.favorite(card: card4, status: true)
        favoriteService.favorite(card: card5, status: true)
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DesafioBootcamp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

