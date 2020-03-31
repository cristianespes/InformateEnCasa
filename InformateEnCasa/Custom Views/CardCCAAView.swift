//
//  CardCCAAView.swift
//  InformateEnCasa
//
//  Created by Cristian Espes on 30/03/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import SwiftUI

struct CardCCAAView: View {
    let region: Region
    
    var body: some View {
        Image(region.getImage())
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width: 220, height: 160)
                .cornerRadius(8)
                .shadow(color: .gray, radius: 4)
            .padding(8)
            .clipped()
    }
}

struct CardCCAAView_Previews: PreviewProvider {
    static var previews: some View {
        CardCCAAView(region: .aragon)
    }
}
