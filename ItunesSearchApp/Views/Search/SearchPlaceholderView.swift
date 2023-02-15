//
//  SearchPlaceholderView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/14/23.
//

import SwiftUI

struct SearchPlaceholderView: View {
    
    @Binding var searchTerm: String
    
    let suggestions = ["rammstein", "cry to me", "maneskin"]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                        .font(.title2)
                }
            }
        }
    }
}

struct SearchPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholderView(searchTerm: .constant("as"))
    }
}
