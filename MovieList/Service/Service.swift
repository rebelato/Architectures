//
//  Service.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import NetworkFramework

protocol ServiceProtocol {
    func getPopularMovies(completion: @escaping(Swift.Result<MovieList, NetworkError>) -> Void)
}

class Service: ServiceProtocol {

    internal let service: NetworkHandlerProtocol
    
    internal init(service: NetworkHandlerProtocol = NetworkHandler()) {
        self.service = service
    }
    
    internal func getPopularMovies(completion: @escaping(Swift.Result<MovieList, NetworkError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/movie/popular?api_key=dcfdbbf8648cddebeb0decb1f27aca9a&language=pt-BR&page=1"
        service.request(with: endpoint, completion: completion)
    }
    
}
