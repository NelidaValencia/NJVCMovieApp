//
//  NJVCDetalOfMoviePresenter.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation

protocol NJVCDetalOfMoviePresenterUI : AnyObject{
    func updateUI (viewModel: NJVCViewModelDetail)
}

protocol NJVCDetalOfMoviePresentable : AnyObject {
    var ui : NJVCDetalOfMoviePresenterUI? { get }
    var movieId : Int { get }
    func onViewAppear()
}

class NJVCDetalOfMoviePresenter : NJVCDetalOfMoviePresentable{
    weak var ui : NJVCDetalOfMoviePresenterUI?
    private let interactor : NJVCDetalOfMovieInteractable
    let movieId : Int
    private let mapper : NJVCMapperDetail
   
    init(interactor: NJVCDetalOfMovieInteractable, movieId: Int, mapper: NJVCMapperDetail) {
        self.interactor = interactor
        self.movieId = movieId
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task{
            let model = await interactor.getDetail(whitId: movieId)
            let viewModel = mapper.map(entity: model)
            await MainActor.run{
                self.ui?.updateUI(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
}
