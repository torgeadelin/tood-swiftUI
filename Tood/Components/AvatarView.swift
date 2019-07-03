//
//  AvatarView.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import SwiftUI

struct AvatarView : View {
    var body: some View {
        Image("avatar")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(
                Circle()
            )
            .frame(width: 50, height: 50)
    }
}

#if DEBUG
struct AvatarView_Previews : PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
#endif
