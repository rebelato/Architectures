//
//  MVVM_DetailViewModel.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Foundation

internal protocol MVVM_DetailViewModelProtocol {
    var title: String { get }
    var overview: String { get }
}

internal struct MVVM_DetailViewModel: MVVM_DetailViewModelProtocol {
    
    internal let title: String
    internal let overview: String
    
    internal init(movie: Movie) {
        title = movie.title
        overview = movie.overview
    }

}
