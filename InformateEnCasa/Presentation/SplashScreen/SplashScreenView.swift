//
//  SplashScreenView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 31/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI
import Combine

struct SplashScreenView: View {
    
    @ObservedObject private var viewModel = SplashScreenViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        return Group {
            if viewModel.data.count == 0 {
                ZStack {
                    //Color.primaryBlue.edgesIgnoringSafeArea(.all)
                    
                    Image("homeApp")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.primaryBlue)
                    .padding(60)
                }
            } else {
                ContentView(viewModel: ContentViewModel(data: viewModel.data))
            }
        }
    }
}

#if DEBUG
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
#endif
