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
    func showMovie(movie: Movie)
}

protocol DetailPresenterToViewProtocol: AnyObject {
    func showMovie(movie: Movie)
}

protocol DetailPresenterToRouterProtocol: AnyObject {
    static func createDetailViewController(movie: Movie)-> Viper_DetailViewController
}

protocol DetailPresenterToInteractorProtocol: AnyObject { }

protocol DetailInteractorToPresenterProtocol: AnyObject { }
