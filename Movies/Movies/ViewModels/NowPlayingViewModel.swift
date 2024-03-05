//
//  NowPlayingViewModel.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import Foundation

class NowPlayingViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func loadNowPlayingMovies() {
        MovieService.shared.fetchNowPlayingMovies { result in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
