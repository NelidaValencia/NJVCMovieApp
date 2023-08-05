//
//  NJVCListOfMovieRouter.swift
//  NJVCMovieApp
//
//  Created by Slacker on 13/07/23.
//

import Foundation
import UIKit
/// 5. Unimos todo lo que tenemos en Entity, Presenter, Interactor y View
///

protocol NJVCListOfMovieRouting: AnyObject {
    var detailRouter : NJVCDetalOfMovieRouting? {get}
    var listOfMovieView : NJVCListOfMovieView? {get}
    func showListOfMovies(window: UIWindow)
    func showDetailMovie(withMovieId movieId: Int)
}

class NJVCListOfMovieRouter : NJVCListOfMovieRouting {
    var detailRouter : NJVCDetalOfMovieRouting?
    var listOfMovieView : NJVCListOfMovieView?
    
    func showListOfMovies(window: UIWindow) {
        self.detailRouter = NJVCDetalOfMovieRouter()
        let interactor = NJVCListOfMovieInteractor()
//        let interactor = NJVCListOfMoviesInteractorMock())
        let presenter = NJVCListOfMoviePresenter(listOfMovieInteractor: interactor, router: self)
        listOfMovieView = NJVCListOfMovieView(presenter: presenter)
        presenter.ui = listOfMovieView
//        view.presenter = presenter
        window.rootViewController = listOfMovieView
        window.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId: Int) {
        guard let fromViewController = listOfMovieView else {
            return
        }
        detailRouter?.showDetail(fromViewViewController: fromViewController, withMovieId: movieId)
    }
}
