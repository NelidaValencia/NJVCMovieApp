//
//  NJVCMapper.swift
//  NJVCMovieApp
//
//  Created by Slacker on 17/07/23.
//

import Foundation

struct Mapper{
    func map(entity: NJVCPopularMovieEntity) -> ViewModel {
        ViewModel(
            title: entity.title,
            overview: entity.overview,
            poster_path: URL(string: "https://image.tmdb.org/t/p/w200" + entity.poster_path)
        )
    }
}
