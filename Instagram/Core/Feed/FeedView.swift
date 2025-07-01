//
//  FeedView.swift
//  Instagram
//
//  Created by Md Rabbi on 6/30/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 10, id: \.self) { index in
                    FeedCell()
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
