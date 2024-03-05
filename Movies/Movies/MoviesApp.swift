//
//  MoviesApp.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import SwiftUI

@main
struct MoviesApp: App {
    @State private var isShowingSplashScreen = true

    var body: some Scene {
        WindowGroup {
            if isShowingSplashScreen {
                SplashScreenView(isShowingSplashScreen: $isShowingSplashScreen)
            } else {
                ContentView()
            }
        }
    }
}
