//
//  AlbumRowView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/18/23.
//

import SwiftUI

struct AlbumRowView: View {
    
    let album: Album
    
    var body: some View {
        HStack {
            
            ImageLoadingView(urlString: album.artworkUrl60, size: 100)
            
            VStack(alignment: .leading) {
                Text(album.collectionName)
                Text(album.artistName)
            }
            .font(.caption)
            Spacer(minLength: 20)
            
            BuyButton(urlString: album.collectionViewURL,
                      price: album.collectionPrice,
                      currency: album.currency)
         
            
        }
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowView(album: Album.example())
    }
}
