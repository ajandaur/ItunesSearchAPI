//
//  SearchAllListView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/14/23.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject  var albumListViewModel: AlbumListViewModel
    @ObservedObject  var songListViewModel: SongListViewModel
    @ObservedObject  var movieListViewModel: MovieListViewModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                HStack {
                    Text("Songs")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        SongListView(viewModel: songListViewModel)
                    } label: {
                        
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }

                    }
                }
                .padding(.horizontal)
                
                SongSectionView(songs: songListViewModel.songs)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Albums")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        AlbumListView(viewModel: albumListViewModel)
                    } label: {
                        
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }

                    }
                }
                .padding(.horizontal)
                
                
                AlbumSectionView(albums: albumListViewModel.albums)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Movies")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        MovieListView(viewModel: movieListViewModel)
                    } label: {
                        
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }

                    }
                }
                .padding(.horizontal)
                
                MovieSectionView(movies: movieListViewModel.movies)
                
            }
        }
  
        
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListViewModel: AlbumListViewModel(), songListViewModel: SongListViewModel(), movieListViewModel: MovieListViewModel())
    }
}
