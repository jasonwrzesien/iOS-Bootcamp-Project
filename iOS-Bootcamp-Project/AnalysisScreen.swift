
//
//  Analysis.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct AnalysisScreen: View {
    var body: some View {
        ZStack{
           Text("Analysis")
                .bold()
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .clipped()
        .ignoresSafeArea()
    }
}

struct AnalysisScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisScreen()
    }
}
