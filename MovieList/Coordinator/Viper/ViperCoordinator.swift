//
//  ViperCoordinator.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Coordinator
import UIKit

class ViperCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var rootNavigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    let title: String

    init(navigationController: UINavigationController = UINavigationController(), title: String = "Viper") {
        self.title = title
        rootNavigationController = navigationController
        initialFlow()
    }

    private func initialFlow() {
        let viewController = Viper_Router.createViperViewController(title: title)
        nextViewController(vc: viewController, transitionStyle: .push)
    }

}
