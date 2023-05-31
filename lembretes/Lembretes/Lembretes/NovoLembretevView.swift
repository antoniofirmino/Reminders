//
//  DetalhesView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct NovoLembreteView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State var notas = ""
    @State var linki = ""
    @State private var hasChanges = false
    @State private var showingCancelConfirmation = false
    
    var body: some View {
        NavigationStack{
            
            Form{
                Section{
                    TextField("Título", text: $title)
                        .onChange(of: title) { _ in
                            hasChanges = true
                        }
                    VStack{
                        TextField("Notas", text: $notas)
                            .onChange(of: notas) { _ in
                                hasChanges = true
                            }
                        Spacer(minLength: 48)
                    }
                    
                }
                Section{
                    NavigationLink(destination: MiniDetalhesView()) {
                        HStack{
                            Text("Detalhes")
                            
                            
                            
                        }
                    }

                    
                }
                
                
                
                                
                
                
                Section{
    
        
        
        
                    NavigationLink(destination: ListaView()) {
                        HStack{
                            Text("Lista")
                            Spacer()
                            HStack{
                                Circle().frame(width:10,height:10).foregroundColor(.yellow)
                                Text("Lembrete").foregroundColor(.gray)
                            }
                            
                        }
                    }
          
        
    

}

                
                
                
                
            }
        }.navigationTitle("Novo Lembrete")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if hasChanges {
                            showingCancelConfirmation = true
                        } else {
                            dismiss()
                        }
                        
                    }, label: {
                        Text("Cancelar")
                    })
                    .confirmationDialog("", isPresented: $showingCancelConfirmation) {
                        Button("Descartar Alterações", role: .destructive, action: dismiss.callAsFunction)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                        
                    }, label: {
                        Text("Adicionar")
                    }).disabled(!hasChanges)
                }
            }
    }
}
            
             
                
            
            
        
    



struct NovoLembrete_Previews: PreviewProvider {
    static var previews: some View {
        NovoLembreteView()
    }
}

