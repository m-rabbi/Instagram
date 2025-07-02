//
//  UploadPostView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var imagePickerPresented: Bool = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                        .fontWeight(.semibold)

                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)

                }

            }
            .padding(.horizontal)
            
            // post image & caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()

                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
                    
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
