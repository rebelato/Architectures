//
//  MVVM_DetailViewModel.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Foundation
import UIKit

internal protocol MVVM_DetailViewModelProtocol {
    var title: String { get }
    var overview: String { get }
    var poster: UIImage? { get }
}

internal struct MVVM_DetailViewModel: MVVM_DetailViewModelProtocol {
    
    internal let title: String
    internal let overview: String
    internal let poster: UIImage?
    
    internal init(movie: Movie, image: UIImage?) {
        title = movie.title
        overview = movie.overview
        poster = image
    }

}
