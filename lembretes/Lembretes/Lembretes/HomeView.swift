//
//  HomeView.swift
//  Lembretes
//
//  Created by João Vitor Gonçalves Oliveira on 23/05/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.timestamp, ascending: true)],
        predicate: NSPredicate(format: "concluded == false"),
        animation: .default)
    private var reminders: FetchedResults<Reminder>
    
    @State private var searchText = ""
    @State private var showingNewReminder = false
    @State private var showingTodosView = false
    @State private var showingConcludedView = false
    
    var body: some View {
        NavigationStack {
            List {
                if searchText.isEmpty {
                    Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                        GridRow {
                            ReminderCategoryCardView(
                                symbolName: "calendar.circle.fill",
                                symbolRenderingMode: .palette,
                                numberOfReminders: 0,
                                categoryName: "Hoje")
                            ReminderCategoryCardView(
                                symbolName: "calendar.circle.fill",
                                symbolRenderingMode: .multicolor,
                                numberOfReminders: 0,
                                categoryName: "Programados")
                        }
                        GridRow {
                            ReminderCategoryCardView(
                                symbolName: "tray.circle.fill",
                                symbolRenderingMode: .palette,
                                symbolForegroundStyle:
                                    SymbolForegroundStyle(
                                        primary: .white,
                                        secondary: .gray),
                                numberOfReminders: reminders.count,
                                categoryName: "Todos")
                            .navigationDestination(isPresented: $showingTodosView) {
                                TodosView()
                            }
                            .onTapGesture {
                                showingTodosView = true
                            }
                            ReminderCategoryCardView(
                                symbolName: "flag.circle.fill",
                                symbolRenderingMode: .multicolor,
                                numberOfReminders: 0,
                                categoryName: "Sinalizados")
                        }
                        GridRow {
                            ReminderCategoryCardView(
                                symbolName: "checkmark.circle.fill",
                                symbolRenderingMode: .palette,
                                symbolForegroundStyle:
                                    SymbolForegroundStyle(
                                        primary: .white,
                                        secondary: .gray),
                                numberOfReminders: -1,
                                categoryName: "Concluídos")
                            .navigationDestination(isPresented: $showingConcludedView) {
                                Concluido()
                            }
                            .onTapGesture {
                                showingConcludedView = true
                            }
                        }
                    }
                        .listSectionSeparator(.hidden)
                    Section {
                        HStack {
                            Text("Minhas Listas")
                                .font(.title2.weight(.bold))
                            Spacer()
                        }
                            .padding(.leading, 12)
                        ReminderListItemView(symbolName: "list.bullet.circle.fill", symbolBackgroundColor: .orange, listName: "Lembretes", numberOfReminders: 0)
                    }
                        .listSectionSeparator(.hidden)
                        .listRowSeparator(.hidden)
                    Spacer()
                        .listSectionSeparator(.hidden)
                } else {
                    List {
                        VStack {
                            HStack (spacing: 0){
                                Text("\(reminders.count) Concluídos • ")
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
                    }
                    .listStyle(.plain)
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $showingNewReminder) {
                NavigationStack{
                    NovoLembreteView()
                        .environment(\.managedObjectContext, viewContext)
                }
            }
            .toolbar {
                ToolbarItem {
                    Menu {
                        Button (action: {
                            
                        }) {
                            Label("Editar Listas", systemImage: "pencil")
                        }
                        Button(action: {
                            
                        }) {
                            Label("Modelos", systemImage: "square.on.square")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        showingNewReminder = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3.weight(.heavy))
                        Text("Novo Lembrete")
                            .fontWeight(.bold)
                    }
                    Button {
                        
                    } label: {
                        Text("Adicionar Lista")
                            .fontWeight(.medium)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Buscar")
        
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
