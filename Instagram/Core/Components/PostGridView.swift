//
//  PostGridView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import SwiftUI

struct PostGridView: View {
    var posts: [Post]
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
            
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
