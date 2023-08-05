//
//  NJVCPopularMoviewResponseEntity.swift
//  NJVCMovieApp
//
//  Created by Slacker on 14/07/23.
//

import Foundation

struct NJVCPopularMoviewResponseEntity: Decodable {
    let results : [NJVCPopularMovieEntity]
}
