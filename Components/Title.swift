//
//  Title.swift
//  BiometricsApp
//
//  Created by Antonella Mariel Lesta on 17/04/2022.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title)
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.mint,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
