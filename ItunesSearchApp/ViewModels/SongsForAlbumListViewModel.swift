//
//  SongsForAlbumListViewModel.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 5/3/23.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    
    let albumID: Int
    @Published var songs = [Song]()
    @Published var state: FetchState = .good 
    
    private let service = APIService()
    
    init(albumID: Int) {
        self.albumID = albumID
        
        print("init for songs for album \(albumID)")
    }
    
    func fetch() {
        fetchSongs(for: albumID)
    }
    
    func fetchSongs(for albumID: Int) {
        
        service.fetchSongs(for: albumID) { [weak self] result in
         
                DispatchQueue.main.async {
                    switch result {
                        
                    case .success(let results):
                        
                        var songs = results.results
                        
                        if results.resultCount > 0 {
                            _ = songs.removeFirst()
                        }
                     
                        
                        self?.songs = songs
                        self?.state = .good
                        print("fetched songs for album id: \(albumID)")
                        
                    case .failure(let error):
                        print("Could not load: \(error)")
                        self?.state = .error("Could not load \(error.localizedDescription)")
                    }
                }
        }
    }
    

}
