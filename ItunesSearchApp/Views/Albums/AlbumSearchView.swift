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
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Album")
        }

    }
}


struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView(viewModel: AlbumListViewModel())
    }
}
