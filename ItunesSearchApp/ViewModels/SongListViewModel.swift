//
//  SongListViewModel.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/6/23.
//

import Foundation

class songListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
   
    @Published var state: FetchState = .good 
    
    @Published var songs: [Song] = [Song]()
    
    let limit = 20
    var page: Int = 0
    
    
    let service = APIService()
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good else { return }
       
        
        state = .isLoading
        
       
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let results):
                    for songs in results.results {
                        self?.songs.append(songs)
                    }
                    
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched \(results.resultCount)")
                    
                case .failure(let error):
                    self?.state = .error("Could not load \(error.localizedDescription)")
                }
            }
        }
        
    }
}
