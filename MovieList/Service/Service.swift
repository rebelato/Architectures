//
//  Service.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import NetworkFramework
import UIKit

internal enum Endpoint: String {
    case popularMovies = "/movie/popular"
    case image = "https://image.tmdb.org/t/p/original"
}

protocol ServiceProtocol {
    func getPopularMovies(completion: @escaping(Swift.Result<MovieList, NetworkError>) -> Void)
    func getImageMovie(with url: String, completion: @escaping(Swift.Result<UIImage?, NetworkError>) -> Void)
}

class Service: ServiceProtocol {

    internal let service: NetworkHandlerProtocol
    
    internal init(service: NetworkHandlerProtocol = NetworkHandler()) {
        self.service = service
    }
    
    internal func getPopularMovies(completion: @escaping(Swift.Result<MovieList, NetworkError>) -> Void) {
        let endpoint = transformToURL(endpoint: .popularMovies)
        service.request(with: endpoint, completion: completion)
    }
    
    internal func getImageMovie(with pathImage: String, completion: @escaping (Result<UIImage?, NetworkError>) -> Void) {
        let endpoint = Endpoint.image.rawValue + pathImage
        service.downloadImage(with: endpoint, completion: completion)
    }
}

extension Service {
    
    private func transformToURL(endpoint: Endpoint) -> String {
        return Constants.baseURL.rawValue +
            endpoint.rawValue +
            "?" +
            Constants.apiKey.rawValue
    }
    
}
