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
        Text("Search all")
        
        Text("Movies: \(movieListViewModel.movies.count)")
        Text("Albums: \(albumListViewModel.albums.count)")
        Text("Songs: \(songListViewModel.songs.count)")
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListViewModel: AlbumListViewModel(), songListViewModel: SongListViewModel(), movieListViewModel: MovieListViewModel())
    }
}
