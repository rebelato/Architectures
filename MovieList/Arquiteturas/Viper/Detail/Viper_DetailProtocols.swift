//
//  Viper_DetailProtocols.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation
import UIKit

protocol DetailViewToPresenterProtocol: AnyObject {
    var view: DetailPresenterToViewProtocol? { get set }
    var interactor: DetailPresenterToInteractorProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    func getPoster(movie: Movie)
}

protocol DetailPresenterToViewProtocol: AnyObject {
    func showMovie(movie: Movie, poster: UIImage?)
}

protocol DetailPresenterToRouterProtocol: AnyObject {
    static func createDetailViewController(movie: Movie) -> Viper_DetailViewController
}

protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    func getPoster(movie: Movie, with url: String)
}

protocol DetailInteractorToPresenterProtocol: AnyObject {
    func showMovie(movie: Movie, poster: UIImage?)
}
