//
//  ReminderListItemView.swift
//  Lembretes
//
//  Created by João Vitor Gonçalves Oliveira on 23/05/23.
//

import SwiftUI

struct ReminderListItemView: View {
    var symbolName: String
    var symbolBackgroundColor: Color
    var listName: String
    var numberOfReminders: Int
    
    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, symbolBackgroundColor)
            Text(listName)
                .font(.body)
            Spacer()
            Text("\(numberOfReminders)")
                .font(.body.weight(.medium))
                .foregroundStyle(.gray)
            Image(systemName: "chevron.right")
                .font(.caption.weight(.bold))
                .foregroundStyle(.gray)
        }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ReminderListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListItemView(symbolName: "list.bullet.circle.fill", symbolBackgroundColor: .orange, listName: "Lembretes", numberOfReminders: 0)
    }
}
