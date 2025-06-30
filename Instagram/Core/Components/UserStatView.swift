//
//  UserStatView.swift
//  Instagram
//
//  Created by Md Rabbi on 6/30/25.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)

            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)    }
}

#Preview {
    UserStatView(value: 3, title: "Followers")
}
