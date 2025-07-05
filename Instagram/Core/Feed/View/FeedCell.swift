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
                    CircularProfileImageView(user: user, size: .xsmall)
                    
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // post image
            KFImage(URL(string: (post.imageUrl)))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
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
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.system(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            
            Text("6h ago")
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
                .foregroundStyle(.secondary)
            

            
        }
        .sheet(isPresented: $showComments, content: {
            CommentsView()
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
