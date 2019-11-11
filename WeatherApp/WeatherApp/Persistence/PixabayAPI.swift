//
//  PixabayAPI.swift
//  WeatherApp
//
//  Created by Kimball Yang on 11/10/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

class PixabayAPIClient {
    
    static let manager = PixabayAPIClient()
    
    static func getSearchResultsURLStr(from searchString: String) -> String {
        let formattedString = searchString.replacingOccurrences(of: " ", with: "+")
        
        return "https://pixabay.com/api/?key=14236028-9dfcf25762643e6323ceb7f1c&q=\(formattedString)"
    }
    func getImage(urlStr: String, completionHandler: @escaping (Result<[Image], AppError>) -> ())  {
        
        guard let url = URL(string: urlStr) else {
            print(AppError.badURL)
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let imageInfo = try ImageWrapper.decodeImagesFromData(from: data)
                    completionHandler(.success(imageInfo))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
                
            }
        }
    }
    
    private init() {}
}
