//
//  FetchState.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/6/23.
//

import Foundation


enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
