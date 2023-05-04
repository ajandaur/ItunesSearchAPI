//
//  AlbumDetailView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 3/1/23.
//

import SwiftUI

struct AlbumDetailView: View {
    
    let album: Album
    
    @StateObject var songsViewModel: SongsForAlbumListViewModel
    
    init(album: Album) {
        self.album = album
        self._songsViewModel = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: album.id))
    }
    
    var body: some View {
        VStack {
            HStack {
                ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                
                VStack(alignment: .leading) {
                    Text(album.collectionName)
                    Text(album.artistName)
                        .font(.footnote)
                        .foregroundColor(Color(.label))
                       
                    
                    Text(album.primaryGenreName)
                        .padding(.bottom, 5)
                    Text("\(album.trackCount) songs")
                    Text("Released: \(formattedDate(value: album.releaseDate))")
                }
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
                
                Spacer(minLength: 20)
                BuyButton(urlString: album.collectionViewURL, price: album.collectionPrice, currency: album.currency)
               
            }
            .padding()
            
            SongForAlbumListView(songsViewModel: songsViewModel)
        }
       
        }
      
        
    func formattedDate(value: String) -> String {
        let dateFormatterGetter = DateFormatter()
        // "2012-01-01T08:00:00Z"
        dateFormatterGetter.dateFormat = "yyy-MM-dd+'T'HH:mm:ss 'Z'"
        
        guard let date = dateFormatterGetter.date(from: value) else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
        
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.example())
    }
}



