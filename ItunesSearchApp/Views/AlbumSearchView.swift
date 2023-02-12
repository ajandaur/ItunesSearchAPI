//
//  AlbumSearchView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 1/2/23.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {

        NavigationStack {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceHolderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Album")
        }

    }
}


struct AlbumPlaceHolderView: View {
    
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

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView(viewModel: AlbumListViewModel())
    }
}
