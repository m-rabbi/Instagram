//
//  CircularProfileImageView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/4/25.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user: User
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray))
            
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[0])
}
