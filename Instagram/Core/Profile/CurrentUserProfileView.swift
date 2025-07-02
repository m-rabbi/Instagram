//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/1/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                VStack(spacing: 10) {
                    // pic and stats
                    HStack {
                        Image("black-panther")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            UserStatView(value: 3, title: "Posts")
                            
                            UserStatView(value: 12, title: "Followers")
                            
                            UserStatView(value: 24, title: "Posts")
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    // name and bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Chadwick Bozeman")
                            .font(.system(size: 14, weight: .semibold))
                        
                        
                        Text("Wakanda Forever")
                            .font(.footnote)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // action button
                    
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 360, height: 32)
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    Divider()
                    
                    
                }
                
                // post grid view
                
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }

                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
