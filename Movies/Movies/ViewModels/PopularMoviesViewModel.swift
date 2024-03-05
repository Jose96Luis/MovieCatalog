//
//  PopularMoviesViewModel.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import Foundation

class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var currentPage = 1
    @Published var isLoading = false
    
    func loadPopularMovies() {
        guard !isLoading else { return }
        isLoading = true
        
        MovieService.shared.fetchPopularMovies(page: currentPage) { [weak self] result in
            switch result {
            case .success(let movieResponse):
                DispatchQueue.main.async {
                    self?.movies.append(contentsOf: movieResponse.results)
                    self?.currentPage += 1
                    self?.isLoading = false
                }
            case .failure(let error):
                print(error.localizedDescription)
                self?.isLoading = false
            }
        }
    }
}
