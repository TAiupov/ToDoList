//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Тагир Аюпов on 2021-03-29.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Nothing to do yet!")
                    .font(.headline)
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add task!")
                            .bold()
                            .font(.title)
                            .frame(height: 55)
                            .frame(maxWidth: 350)
                            .foregroundColor(.white)
                            .padding(.horizontal, animate ? 10 : 20)
                            .background(animate ? Color.blue : Color.accentColor)
                            .cornerRadius(15)
                            .scaleEffect(animate ? 1.1 : 1.0)
                            .offset(y: animate ? -5 : 0)
                            .shadow(color: animate ? Color.blue.opacity(0.7) : Color.accentColor.opacity(0.7),
                                    radius: animate ? 20 : 10,
                                    x: 0.0,
                                    y: animate ? 20 : 10)
                            
                    })
                    
                    
            }
            .padding(30)
            .onAppear(perform: addAnimation)
            
            
        }
        
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            withAnimation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}


struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle(Text("Items"))
        }
    }
}
