//
//  NJVCListOfMoviesInteractorMock.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation

class NJVCListOfMoviesInteractorMock : NJVCListOfMovieInteractable{
    func getListOfMovies() async -> NJVCPopularMoviewResponseEntity {
        return NJVCPopularMoviewResponseEntity(results: [
            .init(id: 0, title: "Data 1", overview: "Description Data 1", poster_path: "", vote_average: 10),
            .init(id: 1, title: "Data 2", overview: "Description Data 2", poster_path: "", vote_average: 9),
            .init(id: 2, title: "Data 3", overview: "Description Data 3", poster_path: "", vote_average: 8),
            .init(id: 3, title: "Data 4", overview: "Description Data 4", poster_path: "", vote_average: 7),
            .init(id: 4, title: "Data 5", overview: "Description Data 5", poster_path: "", vote_average: 6),
            .init(id: 5, title: "Data 6", overview: "Description Data 6", poster_path: "", vote_average: 5)
        ])
    }
    
    
}
