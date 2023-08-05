//
//  NJVCDetalOfMovieView.swift
//  NJVCMovieApp
//
//  Created by Slacker on 18/07/23.
//

import Foundation
import UIKit
import Kingfisher

class NJVCDetalOfMovieView : UIViewController {
    private let presenter : NJVCDetalOfMoviePresentable
    
    let moviewImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameMovie : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionMovie : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(presenter: NJVCDetalOfMoviePresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setUpView()
        presenter.onViewAppear()
    }
    
    func setUpView(){
        view.addSubview(moviewImageView)
        view.addSubview(nameMovie)
        view.addSubview(descriptionMovie)
        NSLayoutConstraint.activate([
            moviewImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviewImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            moviewImageView.heightAnchor.constraint(equalToConstant: 200),
            moviewImageView.widthAnchor.constraint(equalToConstant: 300),
            
            nameMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameMovie.topAnchor.constraint(equalTo: moviewImageView.bottomAnchor, constant: 20),
            
            descriptionMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionMovie.topAnchor.constraint(equalTo: nameMovie.bottomAnchor, constant: 20),
            
        ])
    }
}

extension NJVCDetalOfMovieView : NJVCDetalOfMoviePresenterUI{
    func updateUI(viewModel: NJVCViewModelDetail) {
        nameMovie.text = viewModel.title
        descriptionMovie.text = viewModel.overview
        moviewImageView.kf.setImage(with: viewModel.backdrop_path)
    }
}
