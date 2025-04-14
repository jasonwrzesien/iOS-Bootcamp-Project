//
//  AddPopup.swift
//  iOS-Bootcamp-Project
//
//  Created by Jessica Wrzesien on 4/13/25.
//

import SwiftUI

struct AddPopup: View {
    @Binding var showPopup: Bool

    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var date = Date()
    @State private var recurrence = "Select"
    @State private var showError: Bool = false

    let recurrenceOptions = ["Select", "Daily", "Weekly", "Monthly", "Annually"]
    
    var isFormValid: Bool {
        !name.isEmpty && !amount.isEmpty
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Add New Transaction")
                .font(.headline)

            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            DatePicker("Date", selection: $date, displayedComponents: .date)

            HStack {
                Text("Recurring")
                    .frame(width: 100, alignment: .leading)

                Spacer()

                Picker("", selection: $recurrence) {
                    ForEach(recurrenceOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: 150)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }

            HStack {
                Button("Cancel") {
                    showPopup = false
                }
                .foregroundColor(.red)

                Spacer()

                Button("Add") {
                    if isFormValid {
                        showPopup = false
                    } else {
                        showError = true
                    }
                }
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1.0 : 0.5)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(.ultraThinMaterial))
        .padding()
        .shadow(radius: 10)
    }
}
