//
//  ProgressBarView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI

struct ProgressBarView : View {
    @State var value = 50.0 //percent
    var backgorundColor = Color("gray")
    var foregroundColor = Color.black
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(self.backgorundColor)
                    .cornerRadius(10)
                    .frame(width: geometry.size.width, height: 10)
                Rectangle()
                    .fill(self.foregroundColor)
                    .cornerRadius(10)
                    .frame(width: geometry.size.width * CGFloat(self.value / 100), height: 10)
                    .animation(.basic())
                }
                .frame(height: 10)
            
            }
            .frame(height: 10)
        
    }
}

#if DEBUG
struct ProgressBarView_Previews : PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
#endif



