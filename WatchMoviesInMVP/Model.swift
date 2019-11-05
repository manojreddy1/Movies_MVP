//
//  Model.swift
//  WatchMoviesInMVP
//
//  Created by Vaayoo on 17/05/19.
//  Copyright © 2019 Vaayoo. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let feed: Feed
}
struct Feed: Codable {
    let entry: [Entry]
}
struct Entry: Codable {
    let imName, rights: Icon
    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case rights
    }
}
struct Icon: Codable {
    let label: String
}
