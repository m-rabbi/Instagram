# Instagram Clone

A full-featured Instagram clone iOS app built with **SwiftUI** and **Firebase**.

---

## Overview

This project is a scalable, modern Instagram clone designed to demonstrate proficiency in building production-quality iOS apps using SwiftUI and Firebase. It covers core social media features including:

- User authentication with Firebase Auth
- Feed displaying posts with images and captions
- Search functionality to discover other users and posts
- Upload new posts with image picker and caption input
- Notifications for user interactions
- Profile screens displaying user info and post grid
- Real-time updates and data fetching with async/await

The app showcases advanced SwiftUI patterns such as `@StateObject`, bindings, environment objects, and efficient view lifecycle handling, including dynamic view resets using `.id()` modifiers.

---

## Features

- **Authentication:** Sign up, login, and sign out using Firebase Authentication
- **Feed:** Display posts with image caching (Kingfisher integration), likes, and captions
- **Search:** Search users and posts with live filtering
- **Upload:** Select photos from device using PhotosUI, add captions, and upload to Firebase Storage & Firestore
- **Notifications:** View likes and interactions on your posts
- **Profile:** View your profile and other users’ profiles, including posts grid and stats
- **UI/UX:** Clean, modern design with toolbar actions, smooth tab navigation, and responsive layouts
- **State Management:** Proper use of `@State`, `@StateObject`, and view model patterns
- **View Reset:** Implements view and view model reset logic on tab changes to prevent stale UI state (e.g., resetting the upload view on each access)
- **Image Picker:** Automatically opens photo picker when switching to upload tab for seamless UX

---

## Tech Stack

- SwiftUI — declarative UI framework for iOS
- Firebase — backend services for Auth, Firestore, and Storage
- PhotosUI — native photo picker integration
- Kingfisher — efficient image downloading and caching
- Async/Await — modern concurrency for network and database operations

---

## Project Structure

- **Views:** Modular SwiftUI views per feature (FeedView, SearchView, UploadPostView, NotificationsView, ProfileViews)
- **ViewModels:** MVVM architecture managing business logic and data fetching
- **Services:** Firebase services handling authentication, user management, and post operations

---

## Installation

1. Clone the repository  
   ```bash
   git clone https://github.com/m-rabbi/Instagram.git
   ```
2. Open `Instagram.xcodeproj` in Xcode  
3. Install dependencies (e.g., Firebase, Kingfisher) via Swift Package Manager  
4. Configure your Firebase project and add `GoogleService-Info.plist`  
5. Build and run on simulator or device

---

## Usage

- Launch the app and sign up or login with your credentials  
- Browse the feed to view posts from other users  
- Search for users and posts via the search tab  
- Tap the plus icon to upload a new photo with caption  
- View notifications for interactions on your posts  
- Access your profile to see your posts and statistics  
- Use the logout button in the profile tab to sign out

---

## About the Developer

Md Rabbi is an aspiring iOS developer focused on building clean, scalable apps with SwiftUI and Firebase. This project serves as a showcase of skills in UI design, state management, and backend integration.

---

## License

This project is licensed under the MIT License.
