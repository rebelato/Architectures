//
//  Viper_Router.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation
import UIKit

class Viper_Router: PresenterToRouterProtocol {
    
    static func createViperViewController(title: String) -> Viper_ViewController {
        let viewController = Viper_ViewController(title: title)
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = Viper_Presenter()
        let interactor: PresenterToInteractorProtocol = Viper_Interactor(service: Service())
        let router:PresenterToRouterProtocol = Viper_Router()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
    internal func showDetailViewController(movie: Movie, navigationController: UINavigationController) {
        let detailVC = Viper_DetailRouter.createDetailViewController(movie: movie)
        navigationController.pushViewController(detailVC ,animated: true)
    }
    
}
