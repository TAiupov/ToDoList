//
//  ContentView.swift
//  ToDoList
//
//  Created by Тагир Аюпов on 2021-03-25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                    
                                }
                        }.onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                        
                    }
                }
            }
            
            .navigationBarTitle("To Do ⏳")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink(
                    destination: AddView(),
                    label: {
                        Image(systemName: "plus")
                    }))
            .navigationViewStyle(StackNavigationViewStyle())
    }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ListViewModel())
    }
}


