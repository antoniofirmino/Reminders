//
//  DetalhesView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct NovoLembreteView: View {
    
    @State private var title = ""
    @State var notas = ""
    @State var linki = ""
  
    
    
    
    
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("Título", text: $title)
                    VStack{
                        TextField("Notas", text: $notas)

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
        }.navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Trikas")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("trikas")
                }
            }
    }
}
            
             
                
            
            
        
    



struct NovoLembrete_Previews: PreviewProvider {
    static var previews: some View {
        NovoLembreteView()
    }
}
