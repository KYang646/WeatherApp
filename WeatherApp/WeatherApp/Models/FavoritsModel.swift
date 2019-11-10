//
//  FavoritsModel.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct FavoritedPictures: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let largeImageURL: String?
}
