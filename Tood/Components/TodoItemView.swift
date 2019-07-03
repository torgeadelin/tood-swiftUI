//
//  TodoItemView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI
import Firebase

struct TodoItemView : View {
    @State var todoItem: TodoItem
    //    @State var done: Bool = false
    //    var title: String = "Title of todo"
    //    var subtitle: String = "Preview of more content"
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .fill(self.todoItem.done ? Color.green : Color.gray)
                    .frame(width: 30, height: 30)
                    .animation(.basic())
                
                if self.todoItem.done {
                    Image(systemName: "checkmark")
                        .imageScale(.small)
                        .foregroundColor(Color.green)
                        .animation(.basic())
                    
                }
            }
            VStack(alignment: .leading) {
                Text(todoItem.title)
                    .fontWeight(.bold)
                    .color(self.todoItem.done ? Color.white : Color.black)
                Text(todoItem.text)
                    .color(self.todoItem.done ? Color.white : Color.black)
                    .opacity(0.5)
                }
                .padding(.leading, 5)
            Spacer()
            }
            .padding()
            .padding(.horizontal, 5)
            .background(self.todoItem.done ? Color.black : Color("gray"))
            .cornerRadius(10)
            .animation(.basic())
            .tapAction {
                self.todoItem.toggle()
        }
        
    }
    
    func deleteTodoItem() {
        
    }
}

#if DEBUG
struct TodoItemView_Previews : PreviewProvider {
    static var previews: some View {
        TodoItemView(todoItem: data[0])
    }
}
#endif
