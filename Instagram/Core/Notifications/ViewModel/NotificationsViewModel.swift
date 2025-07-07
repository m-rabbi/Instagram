//
//  NotificationsViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/7/25.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    private let service: NotificationService
    
    init(service: NotificationService) {
        self.service = service
        Task {
            await fetchNotifications()
        }
    } 
    
    @MainActor
    func fetchNotifications() async {
        do {
            self.notifications = try await service.fetchNotification()
        } catch {
            print("DEBUG: Failed to fetch notifications: \(error.localizedDescription)")
        }
    }
}
