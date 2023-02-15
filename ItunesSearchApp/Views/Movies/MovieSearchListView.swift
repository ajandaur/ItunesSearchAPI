//
//  MovieListView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/6/23.
//

import SwiftUI

struct MovieSearchListView: View {
    
    @State private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Movies")
        }
    }
}

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchListView()
    }
}
