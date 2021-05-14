//
//  MVVMCoordinator.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Coordinator
import UIKit

class MVVMCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var rootNavigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    let title: String

    init(navigationController: UINavigationController = UINavigationController(), title: String = "MVVM") {
        self.title = title
        rootNavigationController = navigationController
        initialFlow()
    }

    private func initialFlow() {
        let viewController = MVVM_ViewController(title: title)
        nextViewController(vc: viewController, transitionStyle: .push)
    }

}

extension MVVMCoordinator {

    func handleEvent(with event: Event) {
        switch event as? MVVMEvent {
        case .detail(let movie):
            let vc = MVVM_DetailViewController(movie: movie)
            nextViewController(vc: vc, transitionStyle: .push)
        default:
            break
        }
    }

}
