//
//  NotificationsViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        self.notifications = DeveloperPreview.shared.notifications
    }
}
