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
        
        let presenter = Viper_DetailPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        
        return viewController
    }
    
}
