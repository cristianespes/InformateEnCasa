//
//  EmergencyCallView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 30/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct EmergencyCallView: View {
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    @ObservedObject private var viewModel = EmergencyCallViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Teléfono de información según la comunidad autónoma")
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
                        ForEach(viewModel.regions, id: \.self) { region in
                            VStack(spacing: 20) {
                                CardCCAAView(region: region)
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
                        .foregroundColor(.primaryBlue)
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
            .padding(.vertical)
        }
    }
    
    private func openPhone(with region: Region) {
        guard let number = URL(string: "tel://" + region.getPhoneNumber()) else { return }
        UIApplication.shared.open(number)
    }
}

#if DEBUG
struct EmergencyCallView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyCallView()
    }
}
#endif
