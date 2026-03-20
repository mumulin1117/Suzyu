//
//  AppDelegate.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        SuzySecureVaultSuzy.sharedSuzy.suzyDeconstructAccountSuzy()
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
       
        
        let persistentDataSuzy = SuzySecureVaultSuzy.sharedSuzy.retrieveSecretSuzy(accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
        
        let isGuestUserSuzy = UserDefaults.standard.bool(forKey: SuzySecureVaultSuzy.suzyGuestFlagSuzy)
        
        if persistentDataSuzy != nil {
            AppDelegate.addToRoot()

        } else if isGuestUserSuzy {
            
            AppDelegate.addToRoot()

        } else {
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

