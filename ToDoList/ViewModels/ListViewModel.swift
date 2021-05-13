//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Тагир Аюпов on 2021-03-25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    
    
    let itemListKey: String = "itemList"
    
    init() {
        getItems()
    }
    
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemListKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        items.append(contentsOf: savedItems)
    }
    
    
    func deleteItem(on offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id } ) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encoder = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encoder, forKey: itemListKey)
        }
        
    }
    
    
}
