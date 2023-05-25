//
//  ReminderCategoryCardView.swift
//  Lembretes
//
//  Created by João Vitor Gonçalves Oliveira on 23/05/23.
//

import SwiftUI

struct SymbolForegroundStyle {
    var primary: Color
    var secondary: Color
}

struct ReminderCategoryCardView: View {
    var symbolName: String
    var symbolRenderingMode: SymbolRenderingMode
    var symbolForegroundStyle: SymbolForegroundStyle?
    var numberOfReminders: Int
    var categoryName: String
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: symbolName)
                    .font(.largeTitle)
                    .symbolRenderingMode(symbolRenderingMode)
                    .foregroundStyle(symbolForegroundStyle?.primary ?? .white, symbolForegroundStyle?.secondary ?? .blue)
                Text(categoryName)
                    .font(.body.weight(.bold))
                    .foregroundStyle(.gray)
            }
            Spacer()
            if numberOfReminders >= 0 {
                Text("\(numberOfReminders)")
                    .font(.title.bold())
            }
        }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ReminderCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCategoryCardView(symbolName: "calendar.circle.fill", symbolRenderingMode: .palette, numberOfReminders: 0, categoryName: "Programados")
    }
}
