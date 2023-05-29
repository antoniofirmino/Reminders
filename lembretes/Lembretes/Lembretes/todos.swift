//
//  todos.swift
//  Lembretes
//
//  Created by Lucas Finzzeto Pavarini on 23/05/23.
//

import SwiftUI
   

struct TodosView: View {
    @State private var isSelected = false
    @State private var lembrete = ""
    @State private var showinfo = false
    
    
    
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
                        Image(systemName: isSelected ? "circle.fill" : "circle")
                            .foregroundColor(.blue)
                            .font(.title)
                            .padding(.leading)
                        
                    }
                    
                    TextField("Digite o Lembrete", text: $lembrete)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    
                    Button(action: {
                        showinfo.toggle() 
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showinfo) {
                        DetalhesView()
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
    
    
    
    struct todos_Previews: PreviewProvider {
        static var previews: some View {
            TodosView()
        }
    }
}
