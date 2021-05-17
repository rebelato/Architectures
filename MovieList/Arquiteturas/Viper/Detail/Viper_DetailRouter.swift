//
//  Viper_DetailRouter.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation
import UIKit

class Viper_DetailRouter: DetailPresenterToRouterProtocol {
    
    static func createDetailViewController(movie: Movie) -> Viper_DetailViewController {
        let viewController = Viper_DetailViewController(movie: movie)
        
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = Viper_DetailPresenter()
        let interactor: DetailPresenterToInteractorProtocol = Viper_DetailInteractor(service: Service())
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
}
