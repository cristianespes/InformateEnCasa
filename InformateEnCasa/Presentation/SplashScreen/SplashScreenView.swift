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
    
    @State var data = [CaseByCCAA]()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        var subscribers = Set<AnyCancellable>()
        
        return Group {
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
            let url = URL(string: "https://covid19.isciii.es/resources/serie_historica_acumulados.csv")!
            URLSession.shared
            .dataTaskPublisher(for: url)
            .map {
                String(data: $0.data, encoding: .ascii)
            }
            .map { string -> [CaseByCCAA] in
                CSVManager.shared.parseCSV(dataString: string) ?? []
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { state in
                switch state {
                    case .failure:
                        print("Show error message")
                    default: ()
                }
            }) {
                self.data = $0
            }
            .store(in: &subscribers)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
