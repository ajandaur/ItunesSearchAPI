//
//  ContentView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        
            TabView {
                
                AlbumSearchView()
                    .tabItem {
                        Label("Albums", systemImage: "music.note")
                    }
                
                MovieSearchListView()
                    .tabItem {
                        Label("Movies", systemImage: "tv")
                    }
            
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
