//
//  EmergencyCallView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 30/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct EmergencyCallView: View {
    
    @ObservedObject private var viewModel = EmergencyCallViewModel()
    
    @State private var activePageIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tel. de información")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.horizontal)
            
            Text("Seleccione la bandera para mostrar el teléfono de información")
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding(.horizontal)
            
            GeometryReader { geometry in
                PagingScrollView(
                    activePageIndex: self.$activePageIndex,
                    itemCount: self.viewModel.regions.count,
                    pageWidth: geometry.size.width,
                    tileWidth: CardCCAAView.width + 20,
                    tilePadding: 20) {
                        ForEach(self.viewModel.regions, id: \.self) { region in
                            VStack(spacing: 10) {
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
            }
            .frame(height: 220)
            
            HStack(spacing: 0) {
                Text("#quédate")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.primaryBlue)
                Text("encasa")
                    .font(.title)
                    .bold()
            }
            .padding(.horizontal)
            
            Text("En caso de urgencia sanitaria llamar al 112")
                .font(.system(.body, design: .rounded))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding(.vertical, 20)
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
