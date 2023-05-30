//
//  concluido.swift
//  Lembretes
//
//  Created by Antonio Marcos on 23/05/23.
//

import SwiftUI

struct Concluido: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.text, ascending: true)],
        predicate: NSPredicate(format: "concluded == true"),
        animation: .default)
    private var reminders: FetchedResults<Reminder>

    

    @State private var isSelected = false
    @State private var lembrete = ""
    @State private var showinfo = true
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack (spacing: 0){
                    Text("\(reminders.count) Concluído • ")
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

                

                    }
            
//            VStack {
//                ForEach(reminders) { reminder in
//                    Button(action: {
//                        isSelected.toggle()
//                    }) {
//                        HStack {
//                            Image(systemName: reminder.concluded ? "circle.fill" : "circle")
//                                .foregroundColor(.blue)
//                                .font(.title)
//
//                            Spacer()
//                        }
//
//                    }
//                }
//            }


                Spacer()
            
            .navigationTitle("Concluídos")
            .toolbar{
                ToolbarItem{
                    Menu {
                        Button (action: {
                            
                    }) {
                        Label("Selecionar Lembretes", systemImage: "checkmark.circle")
                        
                        }
                    Button (action: {
                        
                    }) {
                        Label("Imprimir", systemImage: "printer")
                    }
                    } label: {
                                Image(systemName: "ellipsis.circle")
                              }
                            }
                    }
            
            VStack {
                ForEach(reminders) { reminder in
                    Button(action: {
                        isSelected.toggle()
                    }) {
                        HStack {
                            Image(systemName: reminder.concluded ? "circle.fill" : "circle")
                                .foregroundColor(.blue)
                                .font(.title)
                            
                            Spacer()
                        }
                        
                    }
                }
            }
            
            
            
                }
        
            }
    
        }
    
    
    struct Concluido_Previews: PreviewProvider {
        static var previews: some View {
            
            Concluido()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
