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
        
        NavigationStack{
            
            List{
                
                HStack{
                    
                    Button(action: {
                    
                }, label: {
                    Text("Adicionar Lembrete").foregroundColor(.blue)
                }).offset(x:40)
            }
            }.listStyle(.inset)
            
        }.navigationBarTitle("Subtarefas")
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
