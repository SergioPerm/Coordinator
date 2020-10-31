//
//  AppDelegate.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let presenter = ContainerPresenterController()
        coordinator = MainCoordinator(presenter: presenter)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = presenter
        window?.makeKeyAndVisible()
        
        return true
    }


}

