//
//  Dashboard.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI
import FirebaseAuth

struct AccountScreen: View {
    @State private var name: String = "Rachel Fizer" //needs to to get the name from the db
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: EditProfileScreen(name: $name)) {
                    HStack {
                        Text(name)
                        Spacer()
                    }
                }
                
                NavigationLink(destination: ChangePasswordScreen()) {
                    HStack {
                        Text("Change Password")
                        Spacer()
                    }
                }
                
                NavigationLink(destination: SettingsScreen()) {
                    HStack {
                        Text("Dashboard Settings")
                        Spacer()
                    }
                }
                
                NavigationLink(destination: ContentView()) {
                    HStack {
                        Text("Log Out")
                            .foregroundColor(.yellow)
                        Spacer()
                    }
                }.simultaneousGesture(TapGesture().onEnded {
                    do {
                        try Auth.auth().signOut()
                    } catch let err {
                        print("Log Out failed: \(err)")
                    }
                })
                
            }
            .navigationTitle("Account")
            .listStyle(.insetGrouped)
        }
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
