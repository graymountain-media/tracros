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
    let items : [SearchItems]
    
    enum CodingKeys: String, CodingKey {
        case items = "item"
    }
}

struct SearchItems: Codable {
    let name: String
    let ndbno: String
}
