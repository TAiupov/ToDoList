//
//  ListRowView.swift
//  ToDoList
//
//  Created by Тагир Аюпов on 2021-03-25.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First", isCompleted: true)
    static var item2 = ItemModel(title: "Second", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
                .previewLayout(.sizeThatFits)
            ListRowView(item: item2)
                .previewLayout(.sizeThatFits)
        }
    }
}
