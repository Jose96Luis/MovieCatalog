//
//  SplashScreenView.swift
//  Movies
//
//  Created by José Rodriguez Romero on 04/03/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isShowingSplashScreen: Bool

    var body: some View {
        Text("Movies Catalog")
            .font(.largeTitle)
            .foregroundColor(.blue)
            .opacity(isShowingSplashScreen ? 1 : 0)
            .scaleEffect(isShowingSplashScreen ? 1.5 : 1)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isShowingSplashScreen = false
                    }
                }
            }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(isShowingSplashScreen: .constant(true))
    }
}
