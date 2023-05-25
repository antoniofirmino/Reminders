//
//  HomeView.swift
//  Lembretes
//
//  Created by João Vitor Gonçalves Oliveira on 23/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
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
                                numberOfReminders: 0,
                                categoryName: "Todos")
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
                    Text("Resultados da Busca")
                }
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        
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
    }
}
