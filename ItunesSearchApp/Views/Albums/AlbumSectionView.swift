//
//  AlbumSectionView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/20/23.
//

import SwiftUI

struct AlbumSectionView: View {
    
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(albums) { album in
                    VStack {
                        ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                        Text(album.collectionName)
                        Text(album.artistName)
                            .foregroundColor(Color.green)
                    }
                    .lineLimit(2)
                    .frame(width: 100)
                    .font(.caption)
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

