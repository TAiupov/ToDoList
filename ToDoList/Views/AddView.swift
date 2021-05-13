//
//  AddView.swift
//  ToDoList
//
//  Created by Тагир Аюпов on 2021-03-25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var title: String = ""

    
    var body: some View {
        ScrollView {
            VStack {
                TextField("What the fuck do you wanna do?", text: $title)
                    .padding()
                    .background(Color(UIColor.secondarySystemFill))
                    .cornerRadius(5)
                Button(action: saveItem, label: {
                    Text("SAVE")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(5)
                    
                })
                .disabled(title.count < 3)
            }
            .padding()
        }
        .navigationBarTitle("Add Item")
    }
    
    func saveItem() {
        
        listViewModel.addItem(title: title)
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView().environmentObject(ListViewModel())
    }
}
