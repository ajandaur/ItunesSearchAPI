//
//  SongSetionView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/20/23.
//

import SwiftUI

struct SongSectionView: View {
    
    let songs: [Song]
    let rows = Array(repeating: GridItem(.fixed(60), spacing: 0, alignment: .leading), count: 4)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(songs) { song in
                    
                    SongRowView(song: song)
                        .frame(width: 300)
                }
            }
        }
    }
}
