//
//  MovieListViewModel.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/6/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
        
        @Published var searchTerm: String = ""
       
        @Published var state: FetchState = .good
        
        @Published var movies: [Movie] = [Movie]()
        
        let limit = 20
        var page: Int = 0
        
        
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.movies = []
                self?.state = .good
                self?.fetchMovie(for: term)
                
            }.store(in: &subscriptions)
    }
    
    
        let service = APIService()
        
        func fetchMovie(for searchTerm: String) {
            
            guard !searchTerm.isEmpty else { return }
            
            guard state == FetchState.good else { return }
           
            
            state = .isLoading
            
           
            service.fetchMovies(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                        
                    case .success(let results):
                        for movie in results.results {
                            self?.movies.append(movie)
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
    
    func loadMore() {
        fetchMovie(for: searchTerm)
    }
    
    }
