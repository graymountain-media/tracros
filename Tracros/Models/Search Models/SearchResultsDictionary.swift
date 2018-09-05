//
//  SearchResultsDictionary.swift
//  Tracros
//
//  Created by Jake Gray on 7/17/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

struct SearchResultsDictionary: Codable {
    let list : List
    
}

struct List: Codable {
    let items : [SearchItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "item"
    }
}

struct SearchItem: Codable {
    let name: String
    let ndbno: String
}
