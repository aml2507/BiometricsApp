//
//  ContentView.swift
//  BiometricsApp
//
//  Created by Antonella Mariel Lesta on 17/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if authenticationManager.isAuthenticate {
                    VStack(spacing: 40) {
                        Title()
                        
                        Text("Welcome in! You are now authenticated.")
                            .foregroundColor(.white)
                        
                        PrimaryButton(showImage: false, text: "Logout")
                                                    .onTapGesture {
                                                        authenticationManager.logout()
                                                    }
                    }
                    .frame( maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.mint,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                } else {
                    LoginView()
                        .environmentObject(authenticationManager)
                }          
            }
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $authenticationManager.showAlert) {
                Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to log in with credentials, pleasy try again"), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

