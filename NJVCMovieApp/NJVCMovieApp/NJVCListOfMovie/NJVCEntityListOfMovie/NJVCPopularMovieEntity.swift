//
//  NJVCPopularMovieEntity.swift
//  NJVCMovieApp
//
//  Created by Slacker on 14/07/23.
//

import Foundation

struct NJVCPopularMovieEntity : Decodable{
    var id : Int
    var title : String
    var overview : String
    var poster_path : String
    var vote_average : Double
    
    enum codingKeys : String, CodingKey{
        case id
        case title, overview
        case poster_path = "poster_path"
        case vote_average = "vote_average"
    }
}
