//
//  SearchBar.swift
//  SwiftUIGraph
//
//  Created by Mihir vyas on 08/11/23.
//

import SwiftUI

//MARK: - SearchBar
struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                })
                .padding(.trailing, 8)
            }
        }
    }
}
