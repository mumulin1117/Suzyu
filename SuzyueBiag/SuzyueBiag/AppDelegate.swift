//
//  AppDelegate.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/19.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let isRegistered = UserDefaults.standard.bool(forKey: "SuzyIsUserRegisteredSuzy")
     
        let isProfileCompleted = SuzySecureVaultSuzy.sharedSuzy.suzyIsProfileCompletedSuzy()
        
        if isRegistered == true {
            if isProfileCompleted {
               
                AppDelegate.addToRoot()
                   
            } else {
               
                let onboardingVC = SuzyProfileOnboardingControllerSuzy()
                let nav = UINavigationController(rootViewController: onboardingVC)
                nav.navigationBar.isHidden = true
                window?.rootViewController = nav
                
                
            }
           

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

