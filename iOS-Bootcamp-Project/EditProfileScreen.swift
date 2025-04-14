//
//  RecurringScreen.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/14/25.
//
// will need to be changed for the firebase

import SwiftUI

struct EditProfileScreen: View {
    @Binding var name: String

    var body: some View {
        VStack {
            Text("Edit Profile for \(name)")
            // Add TextFields, save button, etc.
        }
        .navigationTitle("Edit Profile")
        .padding()
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen(name: .constant("Rachel"))
    }
}
