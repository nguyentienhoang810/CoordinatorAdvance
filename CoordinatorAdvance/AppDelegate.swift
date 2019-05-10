//
//  AppDelegate.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/07.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navigator = UINavigationController()
        coordinator = MainCoordinator(navigator: navigator)
        coordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigator
        window?.makeKeyAndVisible()
        return true
    }
}

