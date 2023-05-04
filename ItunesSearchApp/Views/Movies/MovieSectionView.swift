//
//  MovieSectionView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/20/23.
//

import SwiftUI

struct MovieSectionView: View {
    
    let movies: [Movie]
    var body: some View {

        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(movies) { movie in
                    VStack {
                        ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
                        Text(movie.trackName)
                        Text(movie.primaryGenreName)
                            .foregroundColor(Color.green)
                    }
                    .lineLimit(2)
                    .frame(width: 80)
                    .font(.caption)
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}
