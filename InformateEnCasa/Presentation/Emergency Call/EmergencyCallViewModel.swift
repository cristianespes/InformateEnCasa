//
//  EmergencyCallViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Combine

final class EmergencyCallViewModel: ObservableObject {
    
    @Published public private(set) var regions: [Region] = []
    
    public init() {
        self.fetchRegions()
    }

    // MARK: - Operations -
    private func fetchRegions() {
        self.regions = Region.allCases
    }
}
