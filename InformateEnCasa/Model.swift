//
//  Model.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 29/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

enum Region: String, CaseIterable {
    case andalucia
    case aragon
    case asturias
    case baleares
    case canarias
    case cantabria
    case castillaLaMancha
    case castillaLeon
    case catalunya
    case ceuta
    case comValenciana
    case extremadura
    case galicia
    case laRioja
    case madrid
    case melilla
    case murcia
    case navarra
    case paisVasco
    
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
}

