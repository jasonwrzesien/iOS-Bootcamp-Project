//
//  TabBar.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house = "house"
    case chartXY = "chart.xyaxis.line"
    case addExpense = "plus.viewfinder"
    case recurring = "clock.arrow.trianglehead.2.counterclockwise.rotate.90"
    case account = "person"
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    @Binding var showAddPopup: Bool
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .yellow : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            if tab == .addExpense {
                                showAddPopup = true
                            } else {
                                withAnimation(.easeIn(duration: 0.1)){
                                     selectedTab = tab
                                }
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.house), showAddPopup: .constant(false))
    }
}

