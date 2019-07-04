//
//  ContentView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView : View {
    @EnvironmentObject var user: UserSettings
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Header()
                    .padding()
                ScrollView(alwaysBounceHorizontal: false, alwaysBounceVertical: true) {
                    VStack(alignment: .leading) {
                        Categories()
                        VStack(alignment: .leading, spacing: 20){
                            HStack(alignment: .bottom) {
                                Text("Today")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("\(self.user.todos.filter{$0.done}.count)/\(self.user.todos.count)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            ProgressBarView(value: 100)
                            
                            
                            ForEach(user.todos) { item in
                                TodoItemView(todoItem: item, store: self.user)
                            }
                            
                            
                            }
                            .padding()
                        Spacer()
                        }
                        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)
                    
                    AddNewButton()
                    
                }
                
            }
            
            
            VStack {
                Text("JE")
                Text("JE")
                Text("JE")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height + 50)
                .background(Color.white)
                .blur(radius: self.user.displayEdit ? 10 : 0)
                
                .offset(x: self.user.displayEdit ? UIScreen.main.bounds.width - 80 : UIScreen.main.bounds.width)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.screen)
                .animation(.basic())
            
            
        }
        .padding(.top, 30)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}
#endif

struct Header : View {
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Monday, 1st July")
                    .font(.subheadline)
            }
            Spacer()
            AvatarView()
        }
    }
}

struct AddNewButton : View {
    var body: some View {
        return VStack(alignment: .center) {
            
            Button(action: {
                self.addNewTodo()
            }) {
                Text("Add")
                    .color(Color.white)
                }
                .padding()
                .padding(.horizontal, 90)
                
                .background(Color.black)
                .cornerRadius(10)
            
            }
            
            .padding(.bottom, 20)
            .background(Color.clear)
    }
    
    func addNewTodo() {
        let newTodo = TodoItem(done: false, title: "New Title", text: "New Text", category: "sport")
        Firestore.firestore().collection("todos").addDocument(data: newTodo.documentData) { (error) in
            if let error = error {
                print(error)
            } else {
                print("success")
            }
        }
        
        
    }
}

struct Categories : View {
    var body: some View {
        return Group {
            VStack(alignment: .leading, spacing: 20){
                
                FeatureItemView()
                Text("Category")
                    .font(.title)
                    .fontWeight(.bold)
                
                }
                .padding()
                .padding(.bottom, -10)
            ScrollView(alwaysBounceHorizontal: true, showsHorizontalIndicator: false) {
                HStack(spacing: 15) {
                    CategoryItemView()
                        .padding(.leading)
                    CategoryItemView()
                    CategoryItemView()
                        .padding(.trailing)
                    
                }
                }.frame(height: 80)
        }
    }
}
