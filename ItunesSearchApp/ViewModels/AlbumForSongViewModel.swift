//
//  AlbumForSongViewModel.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 5/5/23.
//

import Foundation

class AlbumForSongViewModel: ObservableObject {
    
    @Published var album: Album? = nil
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    func fetch(song: Song) {
        
        let albumId = song.collectionID
        
        state = .isLoading
        
        service.fetchAlbums(for: albumId) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("error when fetching album with id: \(error)")
                    self?.state = .error(error.localizedDescription)
                case .success(let results):
                    print("success for fetched album with song \(song.trackName)")
                    self?.album = results.results.first
                }
            }
        }
        
    }
    
}
