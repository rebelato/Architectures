//
//  MVP_Presenter.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Foundation

protocol MVP_PresenterProtocol {
    var delegate: MVP_PresenterDelegate? { get set }
    func getMovies()
}

protocol MVP_PresenterDelegate {
    func render(movies: [Movie])
}

internal struct MVP_Presenter: MVP_PresenterProtocol {
    
    internal var delegate: MVP_PresenterDelegate?
    
    private let service: ServiceProtocol
    
    internal init(service: ServiceProtocol) {
        self.service = service
    }
    
    internal func getMovies() {
        service.getPopularMovies { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    delegate?.render(movies: movie.results)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
