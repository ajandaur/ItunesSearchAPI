//
//  AlbumListView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 12/27/22.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel

    var body: some View {
            List {
                
                ForEach(viewModel.albums) { album in
                    
                    NavigationLink(value: album) {
                        AlbumRowView(album: album)
                    }
                   
                }
                
                switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                    
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                    
                case .loadedAll:
//                    EmptyView()
                    Color.gray
                    
                case .error(let message):
                    Text(message)
                        .foregroundColor(.pink)
                case .noResults:
                    Text("No Results")
                        .foregroundColor(.pink)
                }
            }
            .listStyle(.plain)
        
            .navigationDestination(for: Album.self) { album in
                AlbumDetailView(album: album)
            }
        
    }

}



struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView(viewModel: AlbumListViewModel())
    }
}
