//
//  MVCCoordinator.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Coordinator
import UIKit

class MVCCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var rootNavigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    let title: String

    init(navigationController: UINavigationController = UINavigationController(), title: String = "MVC") {
        self.title = title
        rootNavigationController = navigationController
        initialFlow()
    }

    private func initialFlow() {
        let viewController = MVC_ViewController(title: title)
        nextViewController(vc: viewController, transitionStyle: .push)
    }

}
