//
//  AuthenticationManager.swift
//  BiometricsApp
//
//  Created by Antonella Mariel Lesta on 17/04/2022.
//

import Foundation
import LocalAuthentication
import SwiftUI

class AuthenticationManager : ObservableObject {
    private (set) var context = LAContext()
    @Published private (set) var biometryType: LABiometryType = .none
    private (set) var canEvaluatePolicy = false
    @Published private (set) var isAuthenticate = false
    @Published private (set) var errorDescription: String?
    @Published var showAlert = false
    
    init(){
        getBiometricType()
    }
    
    func getBiometricType() {
        // canEvaluatePolicy will let us know if the user's device supports biometrics authentication
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext() //Reasign the context, recreate the context every time user tries to log in again
        
        if canEvaluatePolicy {
            let reason = "Log into your account"
            
            do {
                let succes = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if succes {
                    DispatchQueue.main.async {
                        self.isAuthenticate = true
                        print("isAuthenticate", self.isAuthenticate)
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
            
        }
    }
    
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "anto" && password == "1234" {
            isAuthenticate = true
        } else {
            errorDescription = "wrong credentials"
            showAlert = true
        }
    }
    
    func logout() {
        isAuthenticate = false
       }
    
}
