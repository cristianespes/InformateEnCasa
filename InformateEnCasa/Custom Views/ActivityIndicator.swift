//
//  ActivityIndicator.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 31/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimation:Bool

    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView()
        activity.color = .black
        return activity
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimation {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
