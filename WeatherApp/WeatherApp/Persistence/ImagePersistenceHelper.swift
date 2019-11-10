//
//  PhotoPersistenceHelper.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//
import Foundation
import UIKit


struct ImagePersistenceHelper {
    
    static let manager = ImagePersistenceHelper()
    func save(newPhoto: Image) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhotos() throws -> [Image] {
        return try persistenceHelper.getObjects()
    }
    
    func deletePhoto(urlString: String) throws {
        try persistenceHelper.delete(elementWith: urlString)
    }
    
    
    private let persistenceHelper = PersistenceHelper<Image>(fileName: "favoritePhotos.plist")
    private init() {}
}
