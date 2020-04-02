//
//  ContentViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Combine

final class ContentViewModel: ObservableObject {
    
    @Published var selected = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    public private(set) var data: [CaseByCCAA]
    
    // MARK: - Bindable Object Protocol -
    public var objectWillChange = PassthroughSubject<Void, Never>()
    
    init(data: [CaseByCCAA]) {
        self.data = data
    }
}
