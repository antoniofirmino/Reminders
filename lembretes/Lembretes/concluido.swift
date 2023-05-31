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
            List {
                
                VStack {
                    HStack (spacing: 0){
                        Text("\(reminders.count) Concluído • ")
                            .font(.headline)
                        
                        Text("Limpar")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                // Excluir o registro
                                reminders.forEach({reminder in
                                    viewContext.delete(reminder)}
                                )
                                           
                               // Salvar as mudanças no contexto
                               do {
                                   try viewContext.save()
                               } catch {
                                   // Tratar erros ao salvar
                                   print("Erro ao salvar: \(error)")
                               }
                            }
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    
                    
                }
                .listRowSeparator(.hidden)
                
                
                Spacer()
                    .listRowSeparator(.hidden)
                
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
                
                    ForEach(reminders) { reminder in
                        Button(action: {
                            
                                reminder.concluded = false
                                do {
                                    try viewContext.save()
                                } catch {
                                    // Tratar erros ao salvar
                                    print("Erro ao salvar: \(error)")
                                }
                            
                        }){
                            HStack {
                                Image(systemName: reminder.concluded ? "circle.fill" : "circle")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                
                                Text(reminder.text ?? "")
                                
                                Spacer()
                            }
                            
                        } .swipeActions{
                            Button("Apagar", role: .destructive){
                                
                                    viewContext.delete(reminder)
                               // Salvar as mudanças no contexto
                               do {
                                   try viewContext.save()
                               } catch {
                                   // Tratar erros ao salvar
                                   print("Erro ao salvar: \(error)")
                               }
                            
                            }
                        }
                    }
                
                
                
            }
            .listStyle(.plain)
        }
        
    }
    
}
    struct Concluido_Previews: PreviewProvider {
        static var previews: some View {
            
            Concluido()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
