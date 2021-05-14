//
//  TabViewController.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    let mvvmCoordinator = MVVMCoordinator()
    let mvcCoordinator = MVCCoordinator()
    let mvpCoordinator = MVPCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let controllers = [
            mvvmCoordinator.rootNavigationController,
            mvcCoordinator.rootNavigationController,
            mvpCoordinator.rootNavigationController
        ]
        
        let tabBarTitle = [
            "MVVM",
            "MVC",
            "MVP"
        ]

        for (index, controller) in controllers.enumerated() {
            controller.tabBarItem = UITabBarItem(title: tabBarTitle[index], image: UIImage(systemName: "airpods"), tag: index)
        }

        viewControllers = controllers
    }

}
