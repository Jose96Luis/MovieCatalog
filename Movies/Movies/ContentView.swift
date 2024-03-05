//
//  ContentView.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    // Datos dummy para películas en reproducción
    let nowPlayingMoviesDummy = [
        "Película 1", "Película 2", "Película 3"
    ]
    
    // Datos dummy para próximas películas
    let upcomingMoviesDummy = [
        "Próxima Película 1", "Próxima Película 2", "Próxima Película 3"
    ]
    
    var body: some View {
        VStack {
            Text("CARTELERA")
                .font(.title)
                .padding()
            
            // Scroll horizontal con las imágenes de los pósters de las películas actualmente en reproducción
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(nowPlayingMoviesDummy, id: \.self) { movie in
                        VStack {
                            Image(systemName: "film")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300)
                            Text(movie)
                        }
                        .frame(width: 200, height: 350)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            
            // Scroll vertical para las próximas películas
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 20) {
                    ForEach(upcomingMoviesDummy, id: \.self) { movie in
                        HStack {
                            Image(systemName: "film.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                            Text(movie)
                        }
                        .frame(height: 150)
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
