//
//  AuthManager.swift
//  iOS-Bootcamp-Project
//
//  Created by Jason Wrzesien on 4/14/25.
//

import SwiftUI
import FirebaseAuth

class AuthManager: ObservableObject {
    @Published var errorMessage: String?
    
    @State private var email = ""
    @State private var password = ""
    
    func signup() async throws {
        _ = try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signin() async throws {
        _ = try await Auth.auth().signIn(withEmail: email, password: password)
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}
