//
//  ContentView.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nowPlayingViewModel = NowPlayingViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("CARTELERA")
                    .font(.title)
                    .padding()
                
                // Scroll horizontal para películas en reproducción
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(nowPlayingViewModel.movies) { movie in
                            VStack {
                                // Aquí usaremos AsyncImage para cargar la imagen desde la URL
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                                    // Se actualiza el manejo de AsyncImage para usar phase
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
            }
            .onAppear {
                nowPlayingViewModel.loadNowPlayingMovies()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
