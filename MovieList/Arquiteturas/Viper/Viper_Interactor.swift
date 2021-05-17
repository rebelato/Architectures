//
//  Viper_Interactor.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 17/05/21.
//

import Foundation

internal class Viper_Interactor: PresenterToInteractorProtocol {
    
    internal var presenter: InteractorToPresenterProtocol?
    
    private let service: ServiceProtocol
    
    internal init(service: ServiceProtocol) {
        self.service = service
    }
    
    internal func getMovies() {
        service.getPopularMovies { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.presenter?.showMovies(movies: movie.results)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
