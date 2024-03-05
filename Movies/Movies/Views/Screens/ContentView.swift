//
//  ContentView.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var nowPlayingViewModel = NowPlayingViewModel()
    @StateObject var popularMoviesViewModel = PopularMoviesViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("CARTELERA")
                        .font(.title)
                        .padding()

                    // Scroll horizontal para películas en reproducción
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(nowPlayingViewModel.movies) { movie in
                                VStack {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable().aspectRatio(contentMode: .fill)
                                        case .failure:
                                            Image(systemName: "film")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(width: 200, height: 300)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    
                                    Text(movie.title)
                                        .frame(width: 200)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 200, height: 350)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Sección de películas populares
                    Text("Películas Populares")
                        .font(.title2)
                        .padding()

                    LazyVStack(alignment: .leading) {
                        ForEach(popularMoviesViewModel.movies) { movie in
                            NavigationLink(destination: Text("Detalle de \(movie.title)")) {
                                HStack {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 100, height: 150)
                                        case .success(let image):
                                            image.resizable().aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 150)
                                        case .failure:
                                            Image(systemName: "film")
                                                .frame(width: 100, height: 150)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .cornerRadius(10)

                                    VStack(alignment: .leading) {
                                        Text(movie.title)
                                            .font(.headline)
                                        Text("Calificación: \(movie.voteAverage, specifier: "%.1f")")
                                            .font(.subheadline)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    .padding([.top, .horizontal])
                }
            }
            .onAppear {
                nowPlayingViewModel.loadNowPlayingMovies()
                popularMoviesViewModel.loadPopularMovies()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
