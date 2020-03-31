//
//  CSVManager.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 30/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import Foundation

final class CSVManager {
    
    static let shared = CSVManager()
    private init() {}
    
    func openCSV(url: String, completionHandler: @escaping (String?)->Void) {
        guard let url = URL(string: url) else {
                print("Error: URL mal formada")
                completionHandler(nil)
                return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Ha ocurrido un error descargando el fichero: \(error.localizedDescription)")
                completionHandler(nil)
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 else {
                print("Ha ocurrido un error con los datos")
                completionHandler(nil)
                return
            }

            let contents = String(data: data, encoding: .ascii)
            completionHandler(contents)
        }.resume()
    }

    func parseCSV(url: String, completionHandler: @escaping ([CaseByCCAA]?)->Void) {
        openCSV(url: url) { contents in
            
            guard let data = contents, !data.isEmpty else {
                print("Contenido vacío")
                completionHandler(nil)
                return
            }
           
            var items = [CaseByCCAA]()
            let lines: [String] = data.components(separatedBy: NSCharacterSet.newlines) as [String]

            for line in lines {
                var values: [String] = []
               
                if line != "" {
                   
                    if line.range(of: "\"") != nil {
                        var textToScan = line
                        var value: String?
                        var textScanner = Scanner(string: textToScan)
                       
                        while !textScanner.isAtEnd {
                           if (textScanner.string as NSString).substring(to: 1) == "\"" {
                               textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)

                               value = textScanner.scanUpToString("\"")
                               textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)
                           } else {
                               value = textScanner.scanUpToString(",")
                           }

                            values.append(value! as String)

                        if !textScanner.isAtEnd {
                            let indexPlusOne = textScanner.string.index(after: textScanner.currentIndex)

                            textToScan = String(textScanner.string[indexPlusOne...])
                        } else {
                            textToScan = ""
                        }
                        
                        textScanner = Scanner(string: textToScan)
                    }
               } else  {
                   values = line.components(separatedBy: ",")
               }

                    let caseByCCAA = CaseByCCAA(CCAAIsoCode: values[0], date: values[1], cases: values[2], sicks: values[3], uci: values[4], deads: values[5])
                    items.append(caseByCCAA)
                }
            }
            
            let lastDate = items.compactMap { $0.date }.filter { !$0.isEmpty }.last
            items = items.filter { $0.date == lastDate }
//            items.forEach {
//                print("---------- ---------- ---------- ---------- ---------- ---------- ---------- ")
//                print("CCCAA: \($0.CCAAIsoCode)")
//                print("Fecha: \($0.date)")
//                print("Casos: \($0.cases)")
//                print("Hospitalizados: \($0.sicks)")
//                print("UCI: \($0.uci)")
//                print("Fallecidos: \($0.deads)")
//            }
            
            completionHandler(items)
        }
    }
}
