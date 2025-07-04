//
//  PostGridView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
            
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
