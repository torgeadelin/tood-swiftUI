//
//  FeatureItemView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI

struct FeatureItemView : View {
    var title = "Some text goes here and some here"
    var subtitle = "And some extra text here and here"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack(alignment: .bottom) {
                Spacer()
                Image("todolist")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 150)
                    .offset(x: 30, y: 10)
                
                }.frame(minHeight: 0, maxHeight: .infinity)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .color(Color.white)
                    .fontWeight(.bold)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 2)
                Text(subtitle)
                    .color(Color.white)
                    .opacity(0.5)                
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(30)
                .padding(.trailing, UIScreen.main.bounds.width/3)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 180)
            .background(Color.black)
            .cornerRadius(20)
        
        
    }
}

#if DEBUG
struct FeatureItem_Previews : PreviewProvider {
    static var previews: some View {
        FeatureItemView()
    }
}
#endif
