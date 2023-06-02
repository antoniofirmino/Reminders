//
//  todos.swift
//  Lembretes
//
//  Created by Lucas Finzzeto Pavarini on 23/05/23.
//

import SwiftUI
   
enum Focusable: Hashable {
  case none
  case row(id: UUID)
}

struct TodosView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.timestamp, ascending: true)],
        predicate: NSPredicate(format: "concluded == false"),
        animation: .default)
    private var reminders: FetchedResults<Reminder>
    
    @FocusState private var isNewReminderTextFieldFocused: Bool
    @FocusState private var focusedReminderTextField: Focusable?
    @State private var lembrete = ""
    @State private var note = ""
    @State private var editReminder = ""
    @State private var editNote = ""
    @State private var showinfo = false
    
    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Text("Lembretes")
                        .font(.title2)
                        .foregroundColor(.orange)
                        .padding()
                        .bold()
                    
                    Spacer()
                }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, -20)
                
                ForEach(reminders) { reminder in
                    HStack(alignment: focusedReminderTextField == .row(id: reminder.id!) ? .top : .center) {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                            .font(.title)
                            .padding(.leading)
                            .onTapGesture {
                                reminder.concluded = true
                                try? viewContext.save()
                            }
                        
                        VStack {
                            
                            TextField("", text: Binding(
                                get: {
                                    reminder.text ?? ""
                                }, set: {
                                    reminder.text = $0
                                    try? viewContext.save()
                                }))
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .focused($focusedReminderTextField, equals: .row(id: reminder.id!))
                            .onTapGesture {
                                focusedReminderTextField = .row(id: reminder.id!)
                            }
                            
                            if focusedReminderTextField == .row(id: reminder.id!) {
                                TextField("Adicionar Nota", text: $editNote)
                            }
                            
                        }
                        
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                            .font(.title)
                            .onTapGesture {
                                showinfo.toggle()
                            }
                            .opacity(focusedReminderTextField == .row(id: reminder.id!) ? 1 : 0)
                    }
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "circle.dotted")
                        .foregroundColor(Color(UIColor.lightGray))
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
            .padding(.leading, -16)
            .padding(.top, -8)
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
                            let newReminder = Reminder(context: viewContext)
                            newReminder.text = lembrete
                            newReminder.timestamp = Date()
                            newReminder.id = UUID()
                            newReminder.concluded = false
                            try? viewContext.save()
                            lembrete = ""
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
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
