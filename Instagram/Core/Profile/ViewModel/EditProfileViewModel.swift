//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Md Rabbi on 7/3/25.
//

import PhotosUI
import Firebase
import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    @Published  var fullname = ""
    @Published  var bio = ""
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var profileImage: Image?
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        // update name if changed
        if user.fullname != fullname && !fullname.isEmpty{
            data["fullname"] = fullname
        }
        
        // update bio if changed
        if user.bio != bio && !bio.isEmpty{
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
