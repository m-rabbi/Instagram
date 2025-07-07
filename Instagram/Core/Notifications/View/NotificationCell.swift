//
//  NotificationCell.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import SwiftUI

struct NotificationCell: View {
    let notification: Notification
    
    var body: some View {
        HStack {
            CircularProfileImageView(size: .xsmall)
            
            // notification message
            HStack {
                 Text("Yoki ")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text("\(notification.type.notificationMessage) ")
                    .font(.subheadline) +
                
                Text("3w")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
            
            Spacer()
            
            if notification.type != .follow {
                Image("venom-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.leading, 2)
            } else {
                Button {
                    print("Handle follow here")
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 88, height: 32)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }

            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell(notification: DeveloperPreview.shared.notifications[2])
}
