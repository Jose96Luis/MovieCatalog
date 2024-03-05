//
//  Movie.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let genreIds: [Int]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
}
