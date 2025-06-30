# Instagram Clone (SwiftUI)

**📱 A complete Instagram style app built in SwiftUI**, designed and developed to replicate Instagram's core and modern social media app functionalities, built from scratch to demonstrate real-world iOS development skills.

---

## 🚀 Features

### Core Features
- **Feed**: Infinite scroll, double-tap to like, like/comment buttons, timestamped posts, swipeable media carousel.
- **Authentication**: Email/password login, signup, password reset, and persistent sessions (Firebase Auth).
- **Post Creation**: Photo/video upload, caption input, basic cropping, and media storage (Firebase Storage & Firestore).
- **Profile**: Customizable profile (bio, picture), view own and other users’ posts in a grid and list layout.
- **Comments**: Add/view comments on posts, like individual comments, dynamic keyboard handling.
- **Explore**: User and hashtag search, trending posts grid view.
- **Notifications**: Feed badge for new likes, comments, followers.
- **Direct Messages (DMs)**: Real-time one-on-one chat with image/text support (via Firebase Firestore).
- **Settings**: Profile editing, logout, dark mode toggle.

### UI/UX & Tech Stack
- SwiftUI & UIKit integration for camera/media picker.
- MVVM architecture with Combine and async/await.
- Custom reusable components (buttons, cards, modals).
- Responsive layout for iPhones & iPads.
- Light & Dark Mode styling.

### Bonus
- Pull-to-refresh in Feed & Messages.
- Carousel post loader; shimmer effect during data fetch.
- Haptic feedback on like/comment actions.
- Custom app icon & launch screen.

---

## 🛠 Tech Stack

- **Language**: Swift 
- **UI**: SwiftUI, `UIViewControllerRepresentable` for camera & picker  
- **Backend**: Firebase (Auth, Firestore, Storage)  
- **Architecture**: MVVM, Combine, async/await  
- **Tools**: Xcode 15+, Git, CocoaPods / Swift Package Manager  
- **Third-party libs**: Kingfisher (image caching), Shimmer (loading effect)

---

## ⚙️ Getting Started

### Prerequisites
- Xcode 15+  
- iOS 16+ Simulator or real device  
- Swift 5.8+  
- Firebase CLI / Firebase Console setup with config files 

### Setup

1. Clone the repo:
    ```bash
    git clone https://github.com/m-rabbi/Instagram.git
    cd Instagram
    ```

2. Install dependencies:
    - *Swift Packages* auto-resolved in Xcode on open
      ```

3. Firebase config:
   - Add `GoogleService-Info.plist` from your Firebase project root → `Instagram/`
   - Ensure Firebase Auth, Firestore, Storage are enabled

4. Run the project:
   - For **Simulator**: no signing required
   - For **Device**: Go to **Signing & Capabilities** → set your own Apple ID team

5. Build & run: ⌘ + R

### Capabilities
- Sign In / Sign Up / Reset password  
- Upload posts and stories  
- View and interact: Feed, Profiles, Explore, Reels, Notifications, Comments, DMs  
- Light / Dark mode, haptics, pull-to-refresh

---

## 🎯 Highlights

- **Component-based SwiftUI UI**: modular views with clear separation
- **Modern concurrency**: async/await for network and DB operations
- **MVVM + Combine**: reactive app logic with observable bindings
- **Smooth user experience**: image caching, pull-to-refresh, loading animations
- **Auth & Realtime data**: fully backed by Firebase features
- **Polished design**: adaptive layout, consistent icons & style

---

