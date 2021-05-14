//
//  MVVMEvent.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import Coordinator
import Foundation

enum MVVMEvent: Event {
    case detail(movie: Movie)
}
