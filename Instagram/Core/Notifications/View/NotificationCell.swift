//
//  NotificationCell.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView(size: .xsmall)
            
            // notification message
            HStack {
                 Text("Yoki ")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text("Liked one of your posts. ")
                    .font(.subheadline) +
                
                Text("3w")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
            
            Spacer()
            
            Image("venom-1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .cornerRadius(10)
                .padding(.leading, 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
