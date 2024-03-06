//
//  APIService.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    private let apiKey = "55957fcf3ba81b137f8fc01ac5a31fb5"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder // Asumiendo que tienes un JSONDecoder configurado para manejar las fechas, etc.
    
    func fetchNowPlayingMovies(page: Int = 1, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        let urlString = "\(baseAPIURL)/movie/now_playing?language=en-US&page=\(page)&api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let moviesResponse = try self.jsonDecoder.decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(moviesResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    // Método similar para `fetchPopularMovies` y `fetchMovieDetail`
    func fetchPopularMovies(page: Int = 1, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        let urlString = "\(baseAPIURL)/movie/popular?language=en-US&page=\(page)&api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let moviesResponse = try self.jsonDecoder.decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(moviesResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchMovieDetails(movieId: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US"
        guard let url = URL(string: urlString) else { return }

        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError()))
                return
            }

            do {
                let movieDetails = try self.jsonDecoder.decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(movieDetails))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
