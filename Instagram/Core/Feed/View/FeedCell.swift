//
//  FeedCell.swift
//  Instagram
//
//  Created by Md Rabbi on 6/30/25.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    @State private var showComments = false

    
    init(post: Post) {
        self.viewModel = FeedCellViewModel(post: post)
    }
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return post.didLike ?? false
    }
    
    var body: some View {
        VStack {
            // user
            HStack {
                if let user = post.user {
                    NavigationLink(destination: ProfileView(user: user)) {
                        HStack {
                            CircularProfileImageView(user: user, size: .xsmall)
                            
                            Text(user.username)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.primary)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // post image
            KFImage(URL(string: (post.imageUrl)))
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 5 / 4)
                .clipped()
                .clipShape(Rectangle())
            
            // action buttons
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundStyle(didLike ? .red : .black)
                        
                }
                
                Button {
                    showComments.toggle()
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()

                
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(.primary)
            
            // likes label
            
            if post.likes > 0 {
                Text("\(post.likes) likes")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                    .padding(.top, 1)
            }
            
            // caption label
            HStack(alignment: .top, spacing: 0) {
                if let user = post.user {
                    NavigationLink(destination: ProfileView(user: user)) {
                        Text(user.username)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primary)
                    }
                    Text(" ")
                    Text(post.caption)
                } else {
                    Text("\(post.user?.username ?? "") ")
                        .fontWeight(.semibold)
                    Text(post.caption)
                }
                Spacer()
            }
            .font(.system(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            
            Text(post.timestamp.timestampString())
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .offset(y: 1)
                .foregroundStyle(.secondary)
            

            
        }
        .sheet(isPresented: $showComments, content: {
            CommentsView(post: post)
                .presentationDragIndicator(.visible)
        })
    }
    
    private func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlike()
            } else {
                try await viewModel.like()
            }
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
