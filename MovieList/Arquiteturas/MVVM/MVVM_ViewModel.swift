//
//  MVVM_ViewModel.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Foundation

internal protocol MVVM_ViewModelProtocol {
    var movies: [Movie] { get }
    var numberOfRows: Int { get }
    var didAction: (Movie) -> () { get }
}

internal struct MVVM_ViewModel: MVVM_ViewModelProtocol {
    
    internal let movies: [Movie]
    internal let numberOfRows: Int
    internal let didAction: (Movie) -> ()
    
    internal init(moviesList: [Movie], completion: @escaping (Movie) -> ()) {
        movies = moviesList
        numberOfRows = movies.count
        didAction = completion
    }
    
}
