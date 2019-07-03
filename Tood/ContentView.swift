//
//  ContentView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject var user: UserSettings
    
    var body: some View {
        VStack(alignment: .leading) {
            Header()
                .padding()
            ScrollView(alwaysBounceHorizontal: false, alwaysBounceVertical: true) {
                VStack(alignment: .leading) {
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
                    VStack(alignment: .leading, spacing: 20){
                        HStack(alignment: .bottom) {
                            Text("Today")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Text("2/3")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        ProgressBarView(value: 60)
                        ForEach(user.todos) { item in
                            TodoItemView(todoItem: item)
                            }

                        }.padding()
                    Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)
                
                
            }
        }
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
