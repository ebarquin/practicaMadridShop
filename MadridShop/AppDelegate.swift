//
//  AppDelegate.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var context: NSManagedObjectContext?

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Core Data Initializaion
        let container = persistentContainer(dbName: DATA_BASE) { (error: NSError) in
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        self.context = container.viewContext
        
        //Check if it's the first time
        let dataDownloaded = UserDefaults.standard.value(forKey: "DataDownloaded")
        if dataDownloaded == nil {
            let getAllShops = ShopsAPIManager()
            ShopsInteractorImpl(shopsAPIManager: getAllShops).execute(completion: { (shops) in
                PersistShopsInteractorImpl(context: self.context!).execute(shops: shops, completion: { (shops: [ShopCoreData]) in
                    
                }, onError: { (error: Error) in
                    fatalError("Unresolved error \(error), \(error.localizedDescription)")
                })
            }, onError: { (error: Error) in
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            })
            
            
        }
        injectContextToFirstViewController()
        
        return true
    }

    func injectContextToFirstViewController() {
        if let initialViewController = window?.rootViewController as? MainViewController
        {
            initialViewController.context = self.context
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context)
    }

    
}

