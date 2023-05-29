//
//  concluido.swift
//  Lembretes
//
//  Created by Antonio Marcos on 23/05/23.
//

import SwiftUI

struct Concluido: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack (spacing: 0){
                    Text("1 Concluído • ")
                        .font(.headline)
                    
                    Text("Limpar")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            //
                                      }
                    
                    Spacer()
                                    }
                
                .padding(.leading)
                Divider()

                Spacer()
                Text("Nenhum lembrete")
                Spacer()
                    }
            .navigationTitle("Concluídos")
            .toolbar{
                ToolbarItem{
                    Menu {
                        Button (action: {
                            
                    }) {
                        Label("Selecionar Lembretes", systemImage: "checkmark.circle")
                        
                        }
                        Label("Imprimir", systemImage: "printer")
                    } label: {
                                Image(systemName: "ellipsis.circle")
                              }
                            }
                    }
                }
            }
        }
    
    
    struct Concluido_Previews: PreviewProvider {
        static var previews: some View {
            Concluido()
        }
    }
