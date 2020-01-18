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
       return "Name: \(name), Artist Name: \(artistName ?? "None")"
    }
    
    var trackName: String? = ""
    var artistName: String? = ""
    
    var name: String {
        return trackName ?? ""
    }
}

class ResultsArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

