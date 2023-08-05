//
//  NJVCMapperDetail.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation

struct NJVCMapperDetail{
    func map(entity: NJVCDetailOfMovieEntity) -> NJVCViewModelDetail {
        .init(
            title: entity.title,
            overview: entity.overview,
            backdrop_path: URL(string: "https://image.tmdb.org/t/p/w1280" + entity.backdropPath)
        )
    }
}
