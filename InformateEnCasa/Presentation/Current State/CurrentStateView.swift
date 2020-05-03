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
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Text("Estado según la comunidad autónoma")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .animation(.none)
                
                Group {
                    Text("Pulse aquí para seleccionar una comunidad autónoma y mostrar sus datos")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(self.viewModel.regions[viewModel.currentSelection].getName())
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(.bottom, viewModel.showPicker ? 0 : 16)
                }
                .animation(.none)
                .onTapGesture {
                    self.viewModel.showPicker.toggle()
                }
                
                if viewModel.showPicker {
                    Picker(selection: $viewModel.currentSelection, label: Text("")) {
                        ForEach(0...viewModel.regions.count - 1, id: \.self) { index in
                            HStack {
                                Image(self.viewModel.regions[index].getImage())
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                Spacer()
                                Text(self.viewModel.regions[index].getName())
                            }
                            .tag(index)
                        }
                    }
                    .labelsHidden()
                    .onTapGesture {
                        self.viewModel.showPicker.toggle()
                    }
                }
                
                VStack(spacing: 20) {
                    VStack(spacing: 8) {
                        Text("Última actualización")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text(self.viewModel.getDate())
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Infectados")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text(self.viewModel.getData().cases)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Hospitalizados")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text(self.viewModel.getData().sicks)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 8) {
                        Text("UCI")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text(self.viewModel.getData().uci)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Fallecidos")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text(self.viewModel.getData().deads)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Recuperados")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text(self.viewModel.getData().recovered)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                }
                .animation(.none)
            }
            .padding(.vertical)
            .animation(.default)
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
