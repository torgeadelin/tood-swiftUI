//
//  CategoryItemView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI

struct CategoryItemView : View {
    var title = "By Veggies please omg"
    var subtitle = "21 items"
    var iconName = "cart.fill"
    
    var body: some View {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.white)
                    Image(systemName: self.iconName)
                        .imageScale(.large)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                }
                VStack(alignment: .leading) {
                    Text(self.title)
                        .font(.headline)
                        .color(.white)
                        .lineLimit(nil)
                    
                    Text(self.subtitle)
                        .font(.caption)
                        .color(.white)
                        .lineLimit(nil)
                }
            }
            .padding(15)
            .background(Color.black)
            .cornerRadius(20)
        }
}

#if DEBUG
struct CategoryItemView_Previews : PreviewProvider {
    static var previews: some View {
        CategoryItemView()
    }
}
#endif
