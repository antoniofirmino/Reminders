//
//  Repetir.swift
//  Project 1 Swift
//
//  Created by Antonio Hoffmann on 22/05/23.
//



import SwiftUI
struct Repetir: View {
    @Binding var valueToModify: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
            
            
            Group{
                Button(action: {
                    updateValue("Nunca")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Nunca")
                }
                
                
                Button(action: {
                    updateValue("A cada hora")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("A cada hora")
                }
                
                
                Button(action: {
                    updateValue("Diariamente")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Diariamente")
                }
                
                
                Button(action: {
                    updateValue("Dias de Semana")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dias de Semana")
                }
            }
            Button(action: {
                updateValue("Fins de Semana")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Fins de Semana")
            }
            Button(action: {
                updateValue("Semanalmente")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Semanalmente")
            }
            Button(action: {
                updateValue("Quinzenalmente")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Quinzenalmente")
            }
            Button(action: {
                updateValue("Mensalmente")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Mensalmente")
            }
            Button(action: {
                updateValue("A Cada 3 Meses")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("A Cada 3 Meses")
            }
            Button(action: {
                updateValue("A Cada 6 Meses")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("A Cada 6 Meses")
            }
            Button(action: {
                updateValue("Anualmente")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Anualmente")
            }
            
            
            
            
            
            
        }
        }.navigationTitle("Repetir")
    }
    
    
    private func updateValue(_ newValue: String) {
        valueToModify = newValue
    }
}

