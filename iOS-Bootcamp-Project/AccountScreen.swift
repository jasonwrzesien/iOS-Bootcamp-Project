//
//  Dashboard.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct AccountScreen: View {
    @State private var firstName: String = "Rachel"
    @State private var lastName: String = "Groove"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("\(firstName) \(lastName)")
                .font(.title)
                .fontWeight(.bold)
                .padding([.top, .leading])
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.systemGroupedBackground))
        .padding(.top, 60)
        .ignoresSafeArea()
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
