//
//  EtiquetasView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct EtiquetasView: View{
    @State private var Lista = [String]()
    @State private var Etiq = ""
    @State private var etiq = 0
    

    var body: some View{
        var trikas = ""
        
        NavigationView{
            Form{
                if Lista.count != 0{
                    Section{
//                        ForEach(0..<Lista.count, id: \.self){ index1 in
//                            Text(Lista[index1])
//                        }
                        Text(Lista.joined(separator:" ")).padding().background(Rectangle().foregroundColor(.blue).cornerRadius(5)).foregroundColor(.black)
                    }
                }
                Section{
                    TextField("Adicionar Nova Etiqueta...", text: $Etiq).onSubmit{
                        trikas = "#\(Etiq)"
                        Lista.append(trikas)
                        Etiq = ""
                    }
                                    }
//                Section{
//                    Text("\(Lista)")
//                }
            }
            
            
        }.navigationBarTitle("Etiquetas")
        
    }
}
struct Etiquetas_Previews: PreviewProvider {
    static var previews: some View {
        EtiquetasView()
    }
}
