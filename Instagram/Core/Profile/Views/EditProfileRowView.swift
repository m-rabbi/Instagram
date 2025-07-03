//
//  EditProfileRowView.swift
//  Instagram
//
//  Created by Md Rabbi on 7/3/25.
//
import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        
        HStack {
                Text(title)
                    .padding(.leading, 8)
                    .frame(width: 100, alignment: .leading)
                
                VStack {
                    TextField(placeholder, text: $text, axis: .horizontal)
                    
                    
                    Divider()
                }
            }
            .font(.subheadline)
            .frame(height: 36)
       
    }
}
