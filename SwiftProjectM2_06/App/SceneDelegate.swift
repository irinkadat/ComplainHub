//
//  SceneDelegate.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        displaySplashScreen()
        window?.makeKeyAndVisible()
    }
    
    private func displaySplashScreen() {
        let splashVC = SplashScreen()
        window?.rootViewController = splashVC
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            let onboardingVC = Onboarding()
            let navigationController = UINavigationController(rootViewController: onboardingVC)
            self?.window?.rootViewController = navigationController
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Handle the scene being disconnected from the session
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Handle the scene becoming active
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Handle the scene resigning active
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Handle the scene entering foreground
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Handle the scene entering background
    }
}
