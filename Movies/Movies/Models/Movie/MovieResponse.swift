//
//  MovieResponse.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}
