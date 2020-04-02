//
//  EmergencyCallViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Combine

final class EmergencyCallViewModel: ObservableObject {
    
    public private(set) var regions: [Region] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }

    // MARK: - Bindable Object Protocol -
    public var objectWillChange = PassthroughSubject<Void, Never>()
    
    public init() {
        self.fetchRegions()
    }

    // MARK: - Operations -
    private func fetchRegions() {
        self.regions = Region.allCases
    }
}
