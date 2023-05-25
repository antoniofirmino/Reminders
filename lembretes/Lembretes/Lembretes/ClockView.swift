//
//  ClockView.swift
//  Project 1 Swift
//
//  Created by Antonio Hoffmann on 22/05/23.
//


import SwiftUI

struct ClockView: View {
    @Binding var selectedTime: Date
    
    var body: some View {
        VStack {
            
            
            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                
                
        }
        
    }
}
