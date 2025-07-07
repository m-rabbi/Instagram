//
//  NotificationsView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var viewModel = NotificationsViewModel(service: NotificationService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20 ) {
                    ForEach(viewModel.notifications) { notification in
                        NotificationCell(notification: notification)
                            .padding(.top)
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
