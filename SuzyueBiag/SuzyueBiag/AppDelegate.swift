//
//  AppDelegate.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/19.
//

import UIKit


//静态混淆问题


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        SuzySecureVaultSuzy.sharedSuzy.suzyDeconstructAccountSuzy()
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let isGuestUserSuzy = UserDefaults.standard.bool(forKey: "SuzyIsUserRegisteredSuzy")
        
        if isGuestUserSuzy == true {
            AppDelegate.addToRoot()

        }  else {
            let navSuzy = UINavigationController(rootViewController: PromiseChainSuzy())
            navSuzy.isNavigationBarHidden = true
            self.window?.rootViewController = navSuzy
        }
        
       
        self.window?.makeKeyAndVisible()
        return true
        
    }

    class func addToRoot(){
        let navSuzy = UINavigationController(rootViewController: SuzyMainDashboardControllerSuzy())
        navSuzy.isNavigationBarHidden = true
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = navSuzy
    }

  

}

