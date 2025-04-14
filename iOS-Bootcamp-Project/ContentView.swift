//
//  ContentView.swift
//  iOS-Bootcamp-Project
//
//  Created by Jason Wrzesien on 4/13/25.
//
//  Home Screen


import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    @State private var showAddPopup = false
    @State private var isLoggedIn = (Auth.auth().currentUser != nil)
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        if isLoggedIn {
            ZStack{
                VStack {
                    TabView(selection: $selectedTab){
                        DashboardScreen()
                            .tag(Tab.house)
                        AnalysisScreen()
                            .tag(Tab.chartXY)
                        RecurringScreen()
                            .tag(Tab.recurring)
                        AccountScreen()
                            .tag(Tab.account)
                    }
                }
                .disabled(showAddPopup)
                .blur(radius: showAddPopup ? 3 : 0)
                
                VStack {
                    Spacer()
                    TabBar(selectedTab: $selectedTab, showAddPopup: $showAddPopup)
                }
                
                if showAddPopup {
                    Color.white.opacity(0.1)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showAddPopup = false
                        }
                    
                    AddPopup(showPopup: $showAddPopup)
                        .transition(.scale)
                        .zIndex(1)
                }
            }
            .onAppear {
                if Auth.auth().currentUser == nil {
                    
                }
                    
            }
        } else {
            AuthView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
