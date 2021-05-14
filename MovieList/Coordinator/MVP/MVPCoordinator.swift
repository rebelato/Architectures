//
//  MVPCoordinator.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Coordinator
import UIKit

class MVPCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var rootNavigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    let title: String

    init(navigationController: UINavigationController = UINavigationController(), title: String = "MVP") {
        self.title = title
        rootNavigationController = navigationController
        initialFlow()
    }

    private func initialFlow() {
        let viewController = MVP_ViewController(title: title)
        nextViewController(vc: viewController, transitionStyle: .push)
    }

}
