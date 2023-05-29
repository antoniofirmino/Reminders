//
//  Test1234.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 24/05/23.
//

import SwiftUI
struct Info: View{
    @State private var isSheetPresented = false
    var body: some View{
        Image(systemName: "info.circle").foregroundColor(.blue).onTapGesture{
            isSheetPresented.toggle()
        }.sheet(isPresented: $isSheetPresented){
            NavigationView{
                DetalhesView().toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancelar"){
                            isSheetPresented = false
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("OK"){
                            isSheetPresented = false
                        }
                    }
//                    ToolbarItem(placement: .principal){
//                        Text("Detalhes").font(.headline)
//                    }
                    


                }.navigationBarTitle("Detalhes")
                    .navigationBarTitleDisplayMode(.inline)
                
            }
            
        }

    }
}
struct Teste_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
