//
//  Movie.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Foundation
import UIKit

internal struct MovieList: Codable {
    let results: [Movie]
}

internal struct Movie: Codable {
    let title: String
    let popularity: Double
    let overview: String
    let poster_path: String
}
