//
//  Dashboard.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

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
                
                Button(action: {
                    // Replace with your logout logic
                    print("Logging out...")
                }) {
                    HStack {
                        Text("Log Out")
                            .foregroundColor(.yellow)
                        Spacer()
                    }
                }
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
