//
//  SongRowView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/18/23.
//

import SwiftUI

struct SongRowView: View {
    
    let song: Song
    
    var body: some View {
        HStack {
            
            ImageLoadingView(urlString: song.artworkUrl60,
                             size: 60)
            
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName + " - " + song.collectionName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            
            Spacer(minLength: 20)
            
            
            
            BuySongButton(urlString: song.previewURL,
                      price: song.trackPrice,
                      currency: song.currency)

        }
    }
}


struct SongRowView_Previews: PreviewProvider {
    static var previews: some View {
        SongRowView(song: Song.example())
    }
}
