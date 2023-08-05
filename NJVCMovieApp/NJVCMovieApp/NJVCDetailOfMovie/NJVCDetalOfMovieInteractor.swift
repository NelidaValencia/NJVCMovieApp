//
//  NJVCDetalOfMovieInteractor.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation

protocol  NJVCDetalOfMovieInteractable : AnyObject {
    func getDetail(whitId id: Int) async -> NJVCDetailOfMovieEntity
}


class NJVCDetalOfMovieInteractor: NJVCDetalOfMovieInteractable{
    func getDetail(whitId id: Int) async -> NJVCDetailOfMovieEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=eefa459b88562f7b5220fcca04c8ec6f")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(NJVCDetailOfMovieEntity.self, from: data)
    }
}
