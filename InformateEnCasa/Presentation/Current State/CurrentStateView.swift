//
//  CurrentStateView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 30/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct CurrentStateView: View {
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    
    var data: [CaseByCCAA]
    @State private var currentData = CaseByCCAA.getEmpty()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Elige tu comunidad autónoma")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Seleccione la bandera para mostrar los datos")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Region.allCases, id: \.self) { region in
                            VStack(spacing: 20) {
                                CardCCAAView(region: region)
                                .onTapGesture {
                                    self.showData(with: region)
                                }
                                
                                Text(region.getName())
                                    .foregroundColor(Color.gray)
                                    .bold()
                            }
                        }
                    }
                    .padding(.horizontal, self.margin)
                }
                
                VStack(spacing: 8) {
                    Text("Infectados")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(currentData.cases)
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                
                VStack(spacing: 8) {
                    Text("Hospitalizados")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(currentData.sicks)
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                
                VStack(spacing: 8) {
                    Text("UCI")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(currentData.uci)
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                
                VStack(spacing: 8) {
                    Text("Fallecidos")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(currentData.deads)
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .onAppear {
            if let first = self.data.first {
                self.currentData = first
            }
        }
    }
    
    private func showData(with region: Region) {
        if let current = data.filter({ $0.CCAAIsoCode == Region.getIsoCode(by: region) }).first {
            self.currentData = current
        } else {
            self.currentData = CaseByCCAA.getEmpty()
        }
    }
}

struct CurrentStateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStateView(data: [
            CaseByCCAA(CCAAIsoCode: "AR", date: "30/03/2020", cases: "XXXX", sicks: "XXXX", uci: "XXXX", deads: "XXXX")
            ]
        )
    }
}
