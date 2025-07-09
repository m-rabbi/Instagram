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
                .font(.system(size: 14, weight: .medium))
        }
        .opacity(value == 0 ? 0.5 : 1)
        .frame(width: 76)    }
}

#Preview {
    UserStatView(value: 3, title: "Followers")
}
