//
//  ContentView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 28/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Elige tu comunidad autónoma")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text("Seleccione la bandera para mostrar el teléfono de información")
                .font(.body)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Region.allCases, id: \.self) { region in
                        VStack(spacing: 20) {
                            Image(region.getImage())
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 220, height: 160)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 4)
                            .padding(8)
                            .clipped()
                            .onTapGesture {
                                self.openPhone(with: region)
                            }
                            
                            Text(region.getName())
                                .foregroundColor(Color.gray)
                                .bold()
                        }
                    }
                }
                .padding(.horizontal, self.margin)
            }
            
            HStack(spacing: 0) {
                Text("#quédate")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(red: 82/255, green: 182/255, blue: 205/255))
                Text("encasa")
                    .font(.title)
                    .bold()
            }
            .padding(.horizontal)
            
            Text("En caso de urgencia sanitaria llamar al 112")
                .font(.body)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    func openPhone(with region: Region) {
        guard let number = URL(string: "tel://" + region.getPhoneNumber()) else { return }
        UIApplication.shared.open(number)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
