//
//  teste1.swift
//  Lembretes
//
//  Created by Lucas Finzzeto Pavarini on 24/05/23.
//

import SwiftUI
   

struct Teste1: View {
    @State private var isSelected = false
    @State private var lembrete = ""
    @State private var showinfo = false
    @FocusState var isInputActive: Bool
    
    
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Text("Lembretes")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .bold()
                    
                    Spacer()
                }
                
                HStack {
                    Button(action: {
                        isSelected.toggle()
                    }) {
                        Image(systemName: isSelected ? "circle.dotted" : "circle")
                            .foregroundColor(.gray)
                            .font(.title)
                            .padding(.leading)
                        
                    }
                    
                    TextField("Digite o Lembrete", text: $lembrete)
                        .textFieldStyle(.roundedBorder)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                       .padding(.leading)
                       .toolbar {
                           ToolbarItemGroup(placement: .keyboard) {
                               Spacer()
                               Button("return") {
                                   isInputActive = false
                                   
                               }
                           }
                       }
                    
                    Button(action: {
                        showinfo.toggle() 
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                    .padding(.trailing)
                    .popover(isPresented: $showinfo) {
                        Text("Alguma informação útil sobre o campo de texto.")
                            .font(.body)
                            .padding()
                    }
                    
                 
                    
                }
                .navigationTitle("Todos")
                .toolbar{
                    ToolbarItem
                    {
                        Menu {
                            Button (action: {
                                
                            }) {
                                Label("Selecionar", systemImage: "checkmark.circle")
                            }
                            Button(action: {
                            }){
                                Label("Mostrar Concluidos",systemImage: "eye")
                            }
                            Button(action: {
                                
                            }) {
                                Label("Imprimir", systemImage: "printer")
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                }
                    
                Spacer()
                
            }
        }
        
    }
    
    struct teste1_Previews: PreviewProvider {
        static var previews: some View {
            Teste1()
        }
    }
}
