//
//  AuthView.swift
//  iOS-Bootcamp-Project
//
//  Created by Jason Wrzesien on 4/14/25.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                NavigationLink(destination: ContentView()) {
                    Text("\(isSignUp ? "Sign Up" : "Sign In")")
                }.simultaneousGesture(TapGesture().onEnded {
                    isSignUp ? register() : login()
                })
                
                Button("\(isSignUp ? "Already have an account? Login" : "Or create an account")") {
                    isSignUp.toggle()
                }
                
                Text(errorMessage)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    AuthView()
}
