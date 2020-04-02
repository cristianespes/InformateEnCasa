//
//  CurrentStateView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 30/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct CurrentStateView: View {
    
    @ObservedObject var viewModel: CurrentStateViewModel
    
    private let margin = (UIScreen.main.bounds.width / 2) - 110 - 8
    
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
                                
                                Text(region.getName())
                                    .foregroundColor(Color.gray)
                                    .bold()
                                
                                VStack(spacing: 8) {
                                    Text("Infectados")
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Text(self.showData(with: region).cases)
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
                                    
                                    Text(self.showData(with: region).sicks)
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
                                    
                                    Text(self.showData(with: region).uci)
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
                                    
                                    Text(self.showData(with: region).deads)
                                        .font(.body)
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, self.margin)
                }
            }
            .padding(.vertical)
        }
    }
    
    private func showData(with region: Region) -> CaseByCCAA {
        if let current = viewModel.data.filter({ $0.CCAAIsoCode == Region.getIsoCode(by: region) }).first {
            return current
        } else {
            return CaseByCCAA.getEmpty()
        }
    }
}

#if DEBUG
struct CurrentStateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStateView(viewModel: CurrentStateViewModel(data: [CaseByCCAA.getEmpty()]))
    }
}
#endif
