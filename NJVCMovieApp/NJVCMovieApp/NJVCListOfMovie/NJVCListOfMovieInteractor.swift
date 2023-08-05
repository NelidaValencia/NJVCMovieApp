//
//  NJVCListOfMovieInteractor.swift
//  NJVCMovieApp
//
//  Created by Slacker on 13/07/23.
//
/// API KEY eefa459b88562f7b5220fcca04c8ec6f
/// API Read Access Token eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZWZhNDU5Yjg4NTYyZjdiNTIyMGZjY2EwNGM4ZWM2ZiIsInN1YiI6IjVkMTZhZTU0YTc2YWM1MDAxODAyOTQ3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.98YpjEkVn6-1wIzH1Reg_1jgBfTL4fo1gfS6RY9qnNM

import Foundation

protocol  NJVCListOfMovieInteractable : AnyObject {
    func getListOfMovies() async -> NJVCPopularMoviewResponseEntity
}

class NJVCListOfMovieInteractor : NJVCListOfMovieInteractable{
///1 . El metodo getListOfMovies es llamado en Presenter
    func getListOfMovies() async -> NJVCPopularMoviewResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=eefa459b88562f7b5220fcca04c8ec6f")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(NJVCPopularMoviewResponseEntity.self, from: data)
    }
}
