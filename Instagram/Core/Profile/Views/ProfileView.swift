//
//  ProfileView.swift
//  Instagram
//
//  Created by Md Rabbi on 6/30/25.
//

import SwiftUI

struct ProfileView: View {
    let user: User
        
    
    
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .tint(.black)
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

#Preview {
    ProfileView(user: User.MOCK_USERS[1])
}
