//
//  ContentView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 28/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    
    var body: some View {
        TabView(selection: $selected) {
            EmergencyCallView()
                .tabItem {
                    Image(systemName: selected == 0 ? "phone.fill" : "phone")
                    Text("Teléfono")
                }
                .tag(0)
            CurrentStateView()
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
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
