//
//  NJVCDetalOfMovieRouter.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation
import UIKit

protocol NJVCDetalOfMovieRouting : AnyObject {
    func showDetail(fromViewViewController: UIViewController ,withMovieId movieId: Int)
}

class NJVCDetalOfMovieRouter : NJVCDetalOfMovieRouting{
    func showDetail(fromViewViewController: UIViewController ,withMovieId movieId: Int) {
        let interactor = NJVCDetalOfMovieInteractor()
        let presenter = NJVCDetalOfMoviePresenter(interactor: interactor,
                                                  movieId: movieId,
                                                  mapper: NJVCMapperDetail())
        let view = NJVCDetalOfMovieView(presenter: presenter)
        presenter.ui = view
        fromViewViewController.present(view, animated: true)
    }
}
