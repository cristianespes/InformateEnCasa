//
//  ContentViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Combine

final class ContentViewModel: ObservableObject {
    
    @Published var selected = 0
    @Published public private(set) var data: [CaseByCCAA]
    
    init(data: [CaseByCCAA]) {
        self.data = data
    }
}
