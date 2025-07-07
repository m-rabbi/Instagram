//
//  NotificationsView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var viewModel = NotificationsViewModel()
    
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
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
