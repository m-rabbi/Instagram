//
//  EditProfileView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/3/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem?
    @State private var fullname = ""
    @State private var bio = ""
    
    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Button {
                        print("update profile info")
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            
            // edit profile pic
            
            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(Circle())
                    
                    Text("Edit profile picture")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $fullname)
                
                EditProfileRowView(title: "BIo", placeholder: "Enter your bio...", text: $bio)

            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
}
