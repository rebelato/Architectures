//
//  Viper_DetailPresenter.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation
import UIKit

internal class Viper_DetailPresenter: DetailViewToPresenterProtocol {

    internal var view: DetailPresenterToViewProtocol?
    internal var interactor: DetailPresenterToInteractorProtocol?
    internal var router: DetailPresenterToRouterProtocol?
    
    internal func getPoster(movie: Movie) {
        interactor?.getPoster(movie: movie, with: movie.poster_path)
    }

}

extension Viper_DetailPresenter: DetailInteractorToPresenterProtocol {

    internal func showMovie(movie: Movie, poster: UIImage?) {
        view?.showMovie(movie: movie, poster: poster)
    }
    
}
