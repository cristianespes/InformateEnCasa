//
//  SplashScreenViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation
import Combine

final class SplashScreenViewModel: ObservableObject {
    
    private var subscribers = Set<AnyCancellable>()
    
    @Published public private(set) var data: [CaseByCCAA] = []
    
    public init() {
        self.fetchCCAAInformation()
    }

    // MARK: - Operations -
    private func fetchCCAAInformation() {
        guard let url = URL(string: "https://covid19.isciii.es/resources/serie_historica_acumulados.csv") else { return }
        
        URLSession.shared
        .dataTaskPublisher(for: url)
        .map {
            String(data: $0.data, encoding: .ascii)
        }
        .map { string -> [CaseByCCAA] in
            CSVManager.shared.parseCSVfromCaseByCCAA(dataString: string) ?? []
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        .sink(receiveCompletion: { state in
            switch state {
                case .failure:
                    // TODO
                    print("Show error message")
                default: ()
            }
        }) {
            self.data = $0
        }
        .store(in: &subscribers)
    }
    
}
