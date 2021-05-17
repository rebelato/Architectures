//
//  ViperProtocols.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func getMovies()
    func showDetailViewController(movie: Movie, navigationController: UINavigationController)
}

protocol PresenterToViewProtocol: AnyObject {
    func showMovies(movies: [Movie])
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createViperViewController(title: String) -> Viper_ViewController
    func showDetailViewController(movie: Movie, navigationController: UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    func getMovies()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func showMovies(movies: [Movie])
}
