//
//  SearchBarView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 07/06/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @FocusState private var nameIsFocused: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? .theme.secondaryText  : .theme.accent)
//                .font(searchText.isEmpty ? .body : .largeTitle)
//                .animation(.easeIn(duration: 0.1), value: searchText)
            
            
            
            
            TextField("Search by name or symbol...", text: $searchText)
                .focused($nameIsFocused)

                .foregroundColor(.theme.accent)
                .autocorrectionDisabled(true)
//                .font(searchText.isEmpty ? .body : .largeTitle)
//                .animation(.easeIn(duration: 0.1), value: searchText)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 0)
                        .foregroundColor(.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
//                            UIApplication.shared.endEditing()
                            nameIsFocused = false

                            searchText = ""
                        }
                    , alignment: .trailing
                )
            
            
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: .theme.accent.opacity(0.15),
                    radius: 10)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
