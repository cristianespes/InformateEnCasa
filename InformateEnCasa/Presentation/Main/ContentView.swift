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
    
    @State private var isAnimating = true
    @State private var selected = 0
    
    var data: [CaseByCCAA]
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    
    var body: some View {
        TabView(selection: $selected) {
            EmergencyCallView()
                .tabItem {
                    Image(systemName: selected == 0 ? "phone.fill" : "phone")
                    Text("Teléfono")
                }
                .tag(0)
            CurrentStateView(data: data)
                .tabItem {
                    Image(systemName: selected == 1 ? "person.3.fill" : "person.3")
                    Text("Estado")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: CaseByCCAA.getTestList())
            //.previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
