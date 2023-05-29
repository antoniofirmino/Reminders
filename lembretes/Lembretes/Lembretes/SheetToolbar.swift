//
//  SheetToolbar.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 29/05/23.
//

import SwiftUI

struct SheetToolbar: ToolbarContent{
    
    var body: some ToolbarContent{
        ToolbarItem(placement: .principal){
            Text("Novo Lembrete")
        }
        ToolbarItem(placement: .cancellationAction){
            Button(action: {},label:{
                Text("Cancelar")
            })
        }
        ToolbarItem(placement: .destructiveAction){
            Button(action: {},label:{
                Text("Adicionar")
                
            })
        }
    }
}
