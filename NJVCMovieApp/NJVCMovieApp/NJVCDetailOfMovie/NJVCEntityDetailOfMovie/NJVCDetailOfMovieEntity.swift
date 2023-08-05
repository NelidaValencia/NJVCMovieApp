//
//  NJVCDetailOfMovieEntity.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation

struct NJVCDetailOfMovieEntity : Decodable {
    let title : String
    let overview : String
    let backdropPath : String
    let status : String
    let releaseDate : String
    let voteAverage : Double
    let voteCount : Int
    
    enum codingKeys : String, CodingKey{
        case title, overview
        case backdropPath = "backdrop_path"
        case status = "status"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case votecount = "vote_count"
    }
}
