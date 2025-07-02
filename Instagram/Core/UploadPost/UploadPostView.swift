//
//  UploadPostView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/2/25.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption: String = ""
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    print("Cancel Upload")
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
                Image("batman-2")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
                    
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    UploadPostView()
}
