//
//  SplashScreenView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 31/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var data = [CaseByCCAA]()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group {
            if data.count == 0 {
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
                ContentView(data: data)
            }
        }
        .onAppear {
            CSVManager.shared.parseCSV(url: "https://covid19.isciii.es/resources/serie_historica_acumulados.csv") { (data) in
                if let data = data {
                    self.data = data
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
