//
//  SongForAlbumListView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 5/3/23.
//

import SwiftUI

@available(iOS 16, *)
struct SongsForAlbumListView: View {
    
    @ObservedObject var songsViewModel: SongsForAlbumListViewModel
    
    let selectedSong: Song?
    
    var body: some View {
        ScrollViewReader { proxy in
            
            ScrollView {
                
                if songsViewModel.state == .isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    
                    Group {
                        if #available(iOS 16, *) {
                            SongGridView(songs: songsViewModel.songs, selectedSong: selectedSong)
                                .onAppear {
                                    print("scroll in list with \(songsViewModel.songs.count) songs")
                                    // proxy.scrollTo(selectedSong?.trackNumber, anchor: .center)
                                }
                        } else {
                            SongStackView(songs: songsViewModel.songs, selectedSong: selectedSong)
                        }
                    }
                    
                    
                  
                }
            }
           
            
            
        }
        
    }

}

struct SongGridView: View {
    
    let songs: [Song]
    let selectedSong: Song?
    
    
    
    
    var body: some View {
        SongStackView(songs: songs, selectedSong: selectedSong)
    }
}

struct SongStackView: View {
    
    let songs: [Song]
    let selectedSong: Song?
    func formattedDuration(time: Int) -> String {
        
        let timeInSeconds = time / 1000
        
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        
        return formatter.string(from: interval) ?? ""
    }
    
    var body: some View {
        Grid(horizontalSpacing: 20) {
            ForEach(songs) { song in
                GridRow {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .gridColumnAlignment(.trailing)
                    
                    Text(song.trackName)
                        .gridColumnAlignment(.leading)
                    
                    Spacer()
                    Text(formattedDuration(time: song.trackTimeMillis))
                        .font(.footnote)
                     
                    
                    BuySongButton(urlString: song.previewURL,
                                  price: song.trackPrice,
                                  currency: song.currency)
                    .padding(.trailing)
                }
                .foregroundColor(song == selectedSong ? Color.accentColor : Color(.label))
                .id(song.trackNumber)
                
                Divider()
            }
        }
        .padding([.vertical, .leading])
    }
}
