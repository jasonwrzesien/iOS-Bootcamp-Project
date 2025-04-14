//
//  RecurringScreen.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct RecurringScreen: View {
    var body: some View {
        ZStack{
           Text("Recurring Charges")
                .bold()
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .clipped()
        .ignoresSafeArea()
    }
}

struct RecurringScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecurringScreen()
    }
}
