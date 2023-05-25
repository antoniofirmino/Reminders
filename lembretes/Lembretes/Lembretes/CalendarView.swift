//
//  CalendarView.swift
//  Project 1 Swift
//
//  Created by Antonio Hoffmann on 22/05/23.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            
            
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .frame(height: 300)
                .padding(.horizontal)
                .environment(\.locale, Locale(identifier: "pt_BR"))
        }
        
    }
}
