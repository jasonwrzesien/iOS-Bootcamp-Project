//
//  AddPopup.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct NotificationsPopup: View {
    @Binding var showPopup: Bool

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                Text("Notifications")
                    .font(.headline)
                    .padding(.top)
                Spacer()
                Button(action: {
                    showPopup = false
                }) {
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: 10) {
                Text("- Your recurring bill is due tomorrow.")
                Text("- Budget update available.")
                Text("- Don't forget to log this week's expenses.")
            }
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
