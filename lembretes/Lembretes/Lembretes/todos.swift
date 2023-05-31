//
//  todos.swift
//  Lembretes
//
//  Created by Lucas Finzzeto Pavarini on 23/05/23.
//

import SwiftUI
   

struct TodosView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.text, ascending: true)],
        animation: .default)
    private var reminders: FetchedResults<Reminder>
    
    @FocusState private var isNewReminderTextFieldFocused: Bool
    @State private var lembrete = ""
    @State private var note = ""
    @State private var showinfo = false
    
    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Text("Lembretes")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .bold()
                    
                    Spacer()
                }
                    .listRowSeparator(.hidden)
                
                HStack(alignment: .top) {
                    Image(systemName: "circle.dotted")
                        .foregroundColor(.blue)
                        .font(.title)
                        .padding(.leading)
                        .onTapGesture {
                            isNewReminderTextFieldFocused = true
                        }
                    
                    VStack {
                        TextField("", text: $lembrete)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .focused($isNewReminderTextFieldFocused)
                        
                        if isNewReminderTextFieldFocused {
                            TextField("Adicionar Nota", text: $note)
                        }
                    }
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.blue)
                        .font(.title)
                        .onTapGesture {
                            showinfo.toggle()
                        }
                        .opacity(isNewReminderTextFieldFocused ? 1 : 0)
                }
                    .padding(.trailing)
                    .listRowSeparator(.visible)
                
                Spacer()
                    .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            .navigationTitle("Todos")
            .sheet(isPresented: $showinfo) {
                NavigationStack{
                    DetalhesView()
                    
                }
            }
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
                if isNewReminderTextFieldFocused {
                    ToolbarItem {
                        Button("OK") {
                            isNewReminderTextFieldFocused = false
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    struct todos_Previews: PreviewProvider {
        static var previews: some View {
            TodosView()
        }
    }
}
