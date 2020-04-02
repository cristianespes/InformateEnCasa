//
//  ContentView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 28/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
        
    @ObservedObject var viewModel: ContentViewModel
    
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    
    var body: some View {
        TabView(selection: $viewModel.selected) {
            EmergencyCallView()
                .tabItem {
                    Image(systemName: viewModel.selected == 0 ? "phone.fill" : "phone")
                    Text("Teléfono")
                }
                .tag(0)
            CurrentStateView(viewModel: CurrentStateViewModel(data: viewModel.data))
                .tabItem {
                    Image(systemName: viewModel.selected == 1 ? "person.3.fill" : "person.3")
                    Text("Estado")
                }
                .tag(1)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(data: CaseByCCAA.getTestList()))
            //.previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
#endif
