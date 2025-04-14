//
//  Dashboard.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct DashboardScreen: View {
    @State private var username: String = "Rachel"
    @State private var showNotifications = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Dashboard")
                    .font(.title)
                    .bold()
                    .padding(.top, 80)
                    .padding(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .clipped()
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showNotifications = true
                    }) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.yellow)
                            .padding()
                    }
                }
                Spacer()
            }
            
            if showNotifications {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showNotifications = false
                    }
                
                NotificationsPopup(showPopup: $showNotifications)
                    .frame(width: 300, height: 400)
                    .background(.thinMaterial)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .padding()
                
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
