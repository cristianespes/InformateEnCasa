//
//  Model.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 29/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

enum Region: String, CaseIterable {
    case andalucia = "AN"
    case aragon = "AR"
    case asturias = "AS"
    case baleares = "IB"
    case canarias = "CN"
    case cantabria = "CB"
    case castillaLaMancha = "CM"
    case castillaLeon = "CL"
    case catalunya = "CT"
    case ceuta = "CE"
    case comValenciana = "VC"
    case extremadura = "EX"
    case galicia = "GA"
    case laRioja = "RI"
    case madrid = "MD"
    case melilla = "ME"
    case murcia = "MC"
    case navarra = "NC"
    case paisVasco = "PV"
    
    func getName() -> String {
        switch self {
        case .andalucia:
            return "Andalucía"
        case .aragon:
            return "Aragón"
        case .asturias:
            return "Principado de Asturias"
        case .baleares:
            return "Islas Baleares"
        case .canarias:
            return "Canarias"
        case .cantabria:
            return "Cantabria"
        case .castillaLaMancha:
            return "Castilla-La Mancha"
        case .castillaLeon:
            return "Castilla y León"
        case .catalunya:
            return "Cataluña"
        case .ceuta:
            return "Ceuta"
        case .comValenciana:
            return "Comunidad Valenciana"
        case .extremadura:
            return "Extremadura"
        case .galicia:
            return "Galicia"
        case .laRioja:
            return "La Rioja"
        case .madrid:
            return "Comunidad de Madrid"
        case .melilla:
            return "Melilla"
        case .murcia:
            return "Región de Murcia"
        case .navarra:
            return "Comunidad Foral de Navarra"
        case .paisVasco:
            return "País Vasco"
        }
    }
    
    func getImage() -> String {
        switch self {
        case .andalucia:
            return "andalucia"
        case .aragon:
            return "aragon"
        case .asturias:
            return "asturias"
        case .baleares:
            return "baleares"
        case .canarias:
            return "canarias"
        case .cantabria:
            return "cantabria"
        case .castillaLaMancha:
            return "castillaLaMancha"
        case .castillaLeon:
            return "castillaYLeon"
        case .catalunya:
            return "cataluna"
        case .ceuta:
            return "ceuta"
        case .comValenciana:
            return "comValenciana"
        case .extremadura:
            return "extremadura"
        case .galicia:
            return "galicia"
        case .laRioja:
            return "rioja"
        case .madrid:
            return "madrid"
        case .melilla:
            return "melilla"
        case .murcia:
            return "murcia"
        case .navarra:
            return "navarra"
        case .paisVasco:
            return "paisVasco"
        }
    }
    
    func getPhoneNumber() -> String {
        switch self {
        case .andalucia:
            return "900400061"
        case .aragon:
            return "976696382"
        case .asturias:
            return "900878232"
        case .baleares:
            return "061"
        case .canarias:
            return "900112061"
        case .cantabria:
            return "900612112"
        case .castillaLaMancha:
            return "900122112"
        case .castillaLeon:
            return "900222000"
        case .catalunya:
            return "061"
        case .ceuta:
            return "900720692"
        case .comValenciana:
            return "900300555"
        case .extremadura:
            return "112"
        case .galicia:
            return "900400116"
        case .laRioja:
            return "941298333"
        case .madrid:
            return "900102112"
        case .melilla:
            return "112"
        case .murcia:
            return "900121212"
        case .navarra:
            return "948290290"
        case .paisVasco:
            return "900203050"
        }
    }
    
    static func getIsoCode(by region: Region) -> String {
        switch region {
        case .andalucia:
            return "AN"
        case .aragon:
            return "AR"
        case .asturias:
            return "AS"
        case .baleares:
            return "IB"
        case .canarias:
            return "CN"
        case .cantabria:
            return "CB"
        case .castillaLaMancha:
            return "CM"
        case .castillaLeon:
            return "CL"
        case .catalunya:
            return "CT"
        case .ceuta:
            return "CE"
        case .comValenciana:
            return "VC"
        case .extremadura:
            return "EX"
        case .galicia:
            return "GA"
        case .laRioja:
            return "RI"
        case .madrid:
            return "MD"
        case .melilla:
            return "ME"
        case .murcia:
            return "MC"
        case .navarra:
            return "NC"
        case .paisVasco:
            return"PV"
        }
    }
}

struct CaseByCCAA: Codable {
    let CCAAIsoCode: String
    let date: String
    let cases: String
    let sicks: String
    let uci: String
    let deads: String
    
    static func getEmpty() -> CaseByCCAA {
        CaseByCCAA(CCAAIsoCode: "", date: "", cases: "----", sicks: "----", uci: "----", deads: "----")
    }
    
    static func getTestList() -> [CaseByCCAA] {
        [
            CaseByCCAA(CCAAIsoCode: "AR", date: "30/03/2020", cases: "XXXX", sicks: "XXXX", uci: "XXXX", deads: "XXXX"),
            CaseByCCAA(CCAAIsoCode: "AN", date: "30/03/2020", cases: "XXXX", sicks: "XXXX", uci: "XXXX", deads: "XXXX")
        ]
    }
}
