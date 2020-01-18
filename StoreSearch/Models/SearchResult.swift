//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Tim Fosteman on 2020-01-18.
//  Copyright © 2020 Fosteman's Software Solutions LLC. All rights reserved.
//

import Foundation

class SearchResult: Codable, CustomStringConvertible {
    var description: String {
        return "Kind: \(kind ?? "None"), Name: \(name), Artist Name: \(artistName ?? "None")\n"
    }
    var trackName: String? = ""
    var artistName: String? = ""
    var name: String {
        return trackName ?? ""
    }
    var kind: String? = ""
    var trackPrice: Double? = 0.0
    var currency = ""
    var imageSmall = ""
    var imageLarge = ""
    var storeURL: String? = ""
    var genre = ""
    enum CodingKeys: String, CodingKey {
      case imageSmall = "artworkUrl60"
      case imageLarge = "artworkUrl100"
      case storeURL = "trackViewUrl"
      case genre = "primaryGenreName"
      case kind, artistName, trackName
      case trackPrice, currency
    }
}

class ResultsArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

