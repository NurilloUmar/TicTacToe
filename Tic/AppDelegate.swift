//
//  AppDelegate.swift
//  Tic
//
//  Created by apple on 31/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let vc = PlayersVC(nibName: "PlayersVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }


}

