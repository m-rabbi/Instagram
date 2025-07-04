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
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        // update name if changed
        if user.fullname != fullname && !fullname.isEmpty{
            print("DEBUG: Update fullname: \(fullname)")
        }
        
        // update bio if changed
        if user.bio != bio && !bio.isEmpty{
            print("DEBIG: update bio: \(bio)")
        }
        
    }
}
