//
//  Movie.swift
//  MovieApp - JSON -
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2022.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let summary: String
    let categories: [String]
    let duration: String
    let rating: Double
    let imageName: String
    
    var imageSmall: String {
        return imageName + "-small"
    }
    
    var imageWide: String {
        return imageName + "-wide"
    }
    
    var categoriesDescription: String {
        return categories.joined(separator: " | ")
        
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case categories
        case duration
        case rating
        case summary
        case imageName = "image_name"
    }
}
