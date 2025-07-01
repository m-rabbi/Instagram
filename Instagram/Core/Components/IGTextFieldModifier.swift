//
//  IGTextFieldModifier.swift
//  Instagram
//
//  Created by Md Rabbi on 7/1/25.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6).opacity(0.8))
            .cornerRadius(10)
            .padding(.horizontal, 24)
        
    }
}
