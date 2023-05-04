//
//  SongForAlbumListView.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 5/3/23.
//

import SwiftUI

struct SongForAlbumListView: View {
    
    @ObservedObject var songsViewModel: SongsForAlbumListViewModel
    
    
    var body: some View {
        ScrollView {
            
            if songsViewModel.state == .isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                Grid(horizontalSpacing: 20) {
                    ForEach(songsViewModel.songs) { song in
                        GridRow {
                            
                            Text("\(song.trackNumber)")
                                .font(.footnote)
                                .gridColumnAlignment(.trailing)
                            
                            Text(song.trackName)
                                .gridColumnAlignment(.leading)
                            
                            Spacer()
                            Text(formattedDuration(time: song.trackTimeMillis))
                                .font(.footnote)
                                .frame(width: 50, alignment: .center)
                            
                            BuySongButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)
                          
                        }
                       
                        Divider()
                    }
             
                .padding([.vertical, .trailing])
                }
      
                   
            }
            
        }
      
    }
    
    func formattedDuration(time: Int) -> String {
        
        let timeInSeconds = time / 1000
        
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        
        return formatter.string(from: interval) ?? ""
    }
}

