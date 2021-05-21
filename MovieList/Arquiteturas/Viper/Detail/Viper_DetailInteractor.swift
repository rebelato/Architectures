//
//  Viper_DetailInteractor.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation

internal class Viper_DetailInteractor: DetailPresenterToInteractorProtocol {
    
    internal var presenter: DetailInteractorToPresenterProtocol?
    
    private let service: ServiceProtocol
    
    internal init(service: ServiceProtocol) {
        self.service = service
    }
    
    internal func getPoster(movie: Movie, with url: String) {
        service.getImageMovie(with: movie.poster_path) { result in
            switch result {
            case .success(let poster):
                DispatchQueue.main.async {
                    self.presenter?.showMovie(movie: movie, poster: poster)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
