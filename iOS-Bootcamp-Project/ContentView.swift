//
//  ContentView.swift
//  iOS-Bootcamp-Project
//
//  Created by Jason Wrzesien on 4/13/25.
//
//  Home Screen


import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    init() {
       UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            VStack {
                TabView(selection: $selectedTab){
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                        }
                        .tag(tab)
                    }
                }
            }
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
