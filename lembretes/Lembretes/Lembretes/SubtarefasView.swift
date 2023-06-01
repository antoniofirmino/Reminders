//
//  SubtarefasView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct SubtarefasView: View {
    @State private var subtasks: [String] = []
    @State var subtaskTextField = ""
    var body: some View {
        VStack {
            HStack {
                
                
                Button(action: {
                   
                    if !subtaskTextField.isEmpty {
                                            subtasks.append(subtaskTextField)
                                            subtaskTextField = ""
                                        }
                    
                    
                    subtaskTextField = ""
                }) {
                    Text("Adicionar")
                        .padding(.horizontal)
                }
            }
            
            List {
                ForEach(subtasks, id: \.self) { subtask in
                    Text(subtask)
                }
                .onDelete(perform: deleteSubtask)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    private func deleteSubtask(at offsets: IndexSet) {
        subtasks.remove(atOffsets: offsets)
    }
}
struct Subtarefas_Previews: PreviewProvider {
    static var previews: some View {
        SubtarefasView()
    }
}
