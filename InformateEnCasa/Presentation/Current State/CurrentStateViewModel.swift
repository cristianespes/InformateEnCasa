//
//  CurrentStateViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Combine

final class CurrentStateViewModel: ObservableObject {
    
    public private(set) var data: [CaseByCCAA]
    public private(set) var regions: [Region] = Region.allCases
        
    // MARK: - Bindable Object Protocol -
    public var objectWillChange = PassthroughSubject<Void, Never>()
    
    init(data: [CaseByCCAA]) {
        self.data = data
    }
}
