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
//        SuzySecureVaultSuzy.sharedSuzy.suzyExecutePermanentAccountDestructionSuzy()
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let isRegistered = UserDefaults.standard.bool(forKey: "SuzyIsUserRegisteredSuzy")
        // 2. 检查资料是否真正填写完成 (对应你 extension 里的逻辑)
           
        let isProfileCompleted = SuzySecureVaultSuzy.sharedSuzy.suzyIsProfileCompletedSuzy()
        
        if isRegistered == true {
            if isProfileCompleted {
                        // 情况 A: 已经注册且资料完整 -> 进入主页
                        // 假设你的主页控制器是 SuzyMainTabBarController
                AppDelegate.addToRoot()
                   
            } else {
                // 情况 B: 已注册但资料未填完 (断点续传) -> 进入资料填写页
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

