//
//  CurrentStateViewModel.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 02/04/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation
import Combine

final class CurrentStateViewModel: ObservableObject, Identifiable {
    
    public private(set) var data: [CaseByCCAA]
    public private(set) var regions: [Region] = Region.allCases
    private var currentData: CaseByCCAA?
    
    @Published var currentSelection: Int = 0 {
        willSet(newIndex) {
            if let newCurrent = data.filter({ $0.CCAAIsoCode == Region.getIsoCode(by: regions[newIndex]) }).first {
                currentData = newCurrent
            } else {
                currentData = CaseByCCAA.getEmpty()
            }
        }
    }
    
    @Published var showPicker = false
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .none
        dateFormatter.locale = Locale(identifier: "es_ES")
        
        return dateFormatter
    }()
            
    init(data: [CaseByCCAA]) {
        self.data = data
    }
    
    func getDate() -> String {
        if let date = currentData?.date {
            return dateFormatter.string(from: date)
        }
        
        return dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
    }
    
    func getData() -> CaseByCCAA {
        if let current = data.filter({ $0.CCAAIsoCode == Region.getIsoCode(by: regions[currentSelection]) }).first {
            return current
        } else {
            return CaseByCCAA.getEmpty()
        }
    }
}
