//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfileView: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "placeholder-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    
                    UserStatView(value: 12, title: "Followers")
                    
                    UserStatView(value: 24, title: "Following")
                }
                
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.system(size: 14, weight: .semibold))
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            Button {
                if user.isCurrentUser {
                    showEditProfileView.toggle()
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(red: 0/255, green: 149/255, blue: 246/255) )
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray : .clear, lineWidth: 1)
                    )
            }
            
            Divider()
            
            
        }
        .fullScreenCover(isPresented: $showEditProfileView) {
            EditProfileView(user: user)
        }

    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
