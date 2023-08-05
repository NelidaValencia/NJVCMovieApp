//
//  NJVCListOfMoviePresenter.swift
//  NJVCMovieApp
//
//  Created by Slacker on 13/07/23.
//

import Foundation

protocol NJVCListOfMoviePresentable : AnyObject {
    var ui: NJVCListOfMovieUI? {get}
    var viewModels: [ViewModel] {get}
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

protocol NJVCListOfMovieUI : AnyObject{
    func update(movies: [ViewModel])
}

class NJVCListOfMoviePresenter : NJVCListOfMoviePresentable{
    
    
    weak var ui: NJVCListOfMovieUI? // weak - se coloca de esta manera y evitamos un retain cycle, Es decir que haya dos referencias fuertes de la view al presenter y vicebersa
    /// 2. Llamamos al metodo del interactor
    private let listOfMovieInteractor: NJVCListOfMovieInteractable
    var viewModels: [ViewModel] = []
    private let mapper : Mapper
    private let router : NJVCListOfMovieRouting
    private var models : [NJVCPopularMovieEntity] = []
    
    init(listOfMovieInteractor: NJVCListOfMovieInteractable, mapper: Mapper = Mapper(), router: NJVCListOfMovieRouting) {
        self.listOfMovieInteractor = listOfMovieInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear(){
        Task{
            models = await listOfMovieInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: movieId)
        print(movieId)
    }
}
