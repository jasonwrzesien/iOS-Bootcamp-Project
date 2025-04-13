//
//  Dashboard.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        ZStack{
           Text("Settings")
                .bold()
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
        .clipped()
        .ignoresSafeArea()
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
