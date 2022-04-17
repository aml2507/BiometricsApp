//
//  CredentialsLogInView.swift
//  BiometricsApp
//
//  Created by Antonella Mariel Lesta on 17/04/2022.
//

import SwiftUI

struct CredentialsLogInView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Title()
            
            TextField ("Username", text: $username)
            
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false, text: "Login")
                .onTapGesture { authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.mint,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialsLogInView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLogInView()
            .environmentObject(AuthenticationManager())
    }
}
