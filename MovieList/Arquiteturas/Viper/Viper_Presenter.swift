//
//  Viper_Presenter.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation
import UIKit

internal class Viper_Presenter: ViewToPresenterProtocol {

    internal var view: PresenterToViewProtocol?
    internal var interactor: PresenterToInteractorProtocol?
    internal var router: PresenterToRouterProtocol?
    
    internal func getMovies() {
        interactor?.getMovies()
    }
    
    internal func showDetailViewController(movie: Movie, navigationController: UINavigationController) {
        router?.showDetailViewController(movie: movie, navigationController: navigationController)
    }

}

extension Viper_Presenter: InteractorToPresenterProtocol{
    
    internal func showMovies(movies: [Movie]) {
        view?.showMovies(movies: movies)
    }
    
}
