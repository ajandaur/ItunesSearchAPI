//
//  APIError.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/6/23.
//

import Foundation


enum EntityType: String {
    case album
    case song
    case movie
}

enum APIError: Error, CustomStringConvertible {

    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
            
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "urlSession error: \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "bad response with status code: \(statusCode)"
        case .decoding(let decodingError):
            return "decoding error: \(decodingError)"
        case .unknown:
            return "unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
            
        case .badURL, .unknown:
            return "something went wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "something went wrong"
        case .badResponse(_):
            return "something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "something went wrong"
            
        }
    }
}