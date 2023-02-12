//
//  Song.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 12/27/22.
//

import Foundation

// MARK: - SongResult
struct SongResult: Codable {
    let resultCount: Int
    let results: [Song]
}

// MARK: - Result
struct Song: Codable {
    let wrapperType: WrapperType
    let kind: Kind
    let artistID, collectionID, trackID: Int
    let artistName, collectionName, trackName, collectionCensoredName: String
    let trackCensoredName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let releaseDate: Date
    let collectionExplicitness: CollectionExplicitness
    let trackExplicitness: TrackExplicitness
    let discCount, discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country: Country
    let currency: Currency
    let primaryGenreName: PrimaryGenreName
    let isStreamable: Bool
    let collectionArtistName: CollectionArtistName?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, collectionArtistName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case contentAdvisoryRating
    }
}

enum CollectionArtistName: String, Codable {
    case jackJohnson = "Jack Johnson"
}

enum CollectionExplicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case song = "song"
}

enum PrimaryGenreName: String, Codable {
    case alternative = "Alternative"
    case alternativeFolk = "Alternative Folk"
    case hipHopRap = "Hip-Hop/Rap"
    case house = "House"
    case pop = "Pop"
    case rock = "Rock"
}

enum TrackExplicitness: String, Codable {
    case cleaned = "cleaned"
    case notExplicit = "notExplicit"
}

enum WrapperType: String, Codable {
    case track = "track"
}
