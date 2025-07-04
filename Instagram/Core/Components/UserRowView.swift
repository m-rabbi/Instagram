//
//  UserRowView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/1/25.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xsmall)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                if let fullname = user.fullname {
                    Text(fullname)
                }
            }
            .font(.system(size: 14))
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserRowView(user: User.MOCK_USERS[0])
}
