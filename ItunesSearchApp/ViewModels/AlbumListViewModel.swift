//
//  AlbumListViewModel.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 12/27/22.
//

import Foundation
import Combine

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {


    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    @Published var state: FetchState = .good {
        didSet {
            print("state changed to \(state)")
        }
    }
    
    let limit = 20
    var page: Int = 0
    var offset: Int = 0
    
    let service = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.albums = []
                self?.state = .good
                self?.fetchAlbums(for: term)
                
            }.store(in: &subscriptions)
    }
    
    func loadMore() {
        fetchAlbums(for: searchTerm)
    }
    
    func fetchAlbums(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        
        guard state == FetchState.good else { return }
        offset = page * limit
        
        state = .isLoading
        
        service.fetchAlbums(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let results):
                    for album in results.results {
                        self?.albums.append(album)
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
