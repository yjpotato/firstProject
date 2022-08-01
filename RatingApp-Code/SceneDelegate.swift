//
//  SceneDelegate.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let homeVC = ViewController()
        let navVC = UINavigationController(rootViewController: homeVC)
        homeVC.navigationItem.title = "Players"
        let gestureVC = GestureViewController()
        
        navVC.tabBarItem = UITabBarItem(title: "Players",
                                        image: UIImage(systemName: "livephoto.play"),
                                        tag: 0)
        gestureVC.tabBarItem = UITabBarItem(title: "Gesture",
                                            image: UIImage(systemName: "tag"),
                                            tag: 1)
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navVC, gestureVC]
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
    
}
